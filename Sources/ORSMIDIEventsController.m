//
//  ORSMIDIEventsController.m
//  MIDI File Explorer
//
//  Created by Andrew R Madsen on 10/6/20.
//  Copyright © 2020 Open Reel Software. All rights reserved.
//

#import "ORSMIDIEventsController.h"
#import "MIKMIDIEvent+GrossHacks.h"

@implementation ORSMIDIEventsController

- (NSArray *)arrangeObjects:(NSArray *)objects
{
    for (MIKMIDIEvent *event in objects) {
        event.sequence = self.sequence;
    }
    return objects;
}

@end
