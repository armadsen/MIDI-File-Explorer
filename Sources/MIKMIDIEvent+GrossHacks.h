//
//  MIKMIDIEvent+GrossHacks.h
//  MIDI File Explorer
//
//  Created by Andrew R Madsen on 8/25/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

#import <MIKMIDI/MIKMIDI.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIKMIDIEvent (GrossHacks)

@property (nonatomic, readonly) NSString *eventTypeName;
@property (nonatomic, readonly) NSString *displayTimeStampString;
@property (nonatomic, weak) MIKMIDISequence *sequence;

@end

@interface MIKMIDISequence (GrossHacks)

@property (nonatomic, readonly) NSArray *tracksIncludingTempo;

@end

NS_ASSUME_NONNULL_END
