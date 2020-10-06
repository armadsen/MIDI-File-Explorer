//
//  ORSMIDIEventsController.h
//  MIDI File Explorer
//
//  Created by Andrew R Madsen on 10/6/20.
//  Copyright © 2020 Open Reel Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MIKMIDISequence;

NS_ASSUME_NONNULL_BEGIN

@interface ORSMIDIEventsController : NSArrayController

@property (nonatomic, strong) MIKMIDISequence *sequence;

@end

NS_ASSUME_NONNULL_END
