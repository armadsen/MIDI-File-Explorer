//
//  MIKMIDIEvent+GrossHacks.m
//  MIDI File Explorer
//
//  Created by Andrew R Madsen on 8/25/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

#import "MIKMIDIEvent+GrossHacks.h"
#import <objc/runtime.h>

static void *SequenceKey = &SequenceKey;

@implementation MIKMIDIEvent (GrossHacks)

- (NSString *)eventTypeName
{
	NSMutableString *result = [NSStringFromClass([self class]) mutableCopy];
	[result replaceOccurrencesOfString:@"MIKMIDI" withString:@"" options:0 range:NSMakeRange(0, result.length)];
	[result replaceOccurrencesOfString:@"Mutable" withString:@"" options:0 range:NSMakeRange(0, result.length)];
	[result replaceOccurrencesOfString:@"Event" withString:@"" options:0 range:NSMakeRange(0, result.length)];
	return result;
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingDisplayTimeStampString
{
    return [NSSet setWithObjects:@"timestamp", @"sequence", nil];
}

- (NSString *)displayTimeStampString
{
    MusicTimeStamp timestamp = [self timeStamp];
    if (!self.sequence) { return [NSString stringWithFormat:@"%@", @(timestamp)]; }
    NSTimeInterval timeInSeconds = [self.sequence timeInSecondsForMusicTimeStamp:timestamp];
    NSString *result = [NSString stringWithFormat:@"%@ (%.2f s)", @(timestamp), timeInSeconds];
    return result;
}

- (MIKMIDISequence *)sequence
{
    return objc_getAssociatedObject(self, SequenceKey);
}

- (void)setSequence:(MIKMIDISequence *)sequence
{
    objc_setAssociatedObject(self, SequenceKey, sequence, OBJC_ASSOCIATION_ASSIGN);
}

@end

@implementation MIKMIDISequence (GrossHacks)

+ (NSSet<NSString *> *)keyPathsForValuesAffectingTracksIncludingTempo
{
	return [NSSet setWithObjects:@"tempoTrack", @"tracks", nil];
}

- (NSArray *)tracksIncludingTempo
{
	NSMutableArray *tracks = [self.tracks mutableCopy] ?: [NSMutableArray array];
	if (self.tempoTrack) { [tracks insertObject:self.tempoTrack atIndex:0]; }
	return [tracks copy];
}

@end
