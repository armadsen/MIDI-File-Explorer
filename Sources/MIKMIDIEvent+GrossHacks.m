//
//  MIKMIDIEvent+GrossHacks.m
//  MIDI File Explorer
//
//  Created by Andrew R Madsen on 8/25/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

#import "MIKMIDIEvent+GrossHacks.h"

@implementation MIKMIDIEvent (GrossHacks)

- (NSString *)eventTypeName
{
	NSMutableString *result = [NSStringFromClass([self class]) mutableCopy];
	[result replaceOccurrencesOfString:@"MIKMIDI" withString:@"" options:0 range:NSMakeRange(0, result.length)];
	[result replaceOccurrencesOfString:@"Mutable" withString:@"" options:0 range:NSMakeRange(0, result.length)];
	[result replaceOccurrencesOfString:@"Event" withString:@"" options:0 range:NSMakeRange(0, result.length)];
	return result;
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
