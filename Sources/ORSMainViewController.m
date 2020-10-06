//
//  ORSMainViewController.m
//  MIDI File Explorer
//
//  Created by Andrew Madsen on 4/22/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

#import "ORSMainViewController.h"
#import <MIKMIDI/MIKMIDI.h>
#import "MIKMIDIEvent+GrossHacks.h"
#import "ORSMIDIEventsController.h"

@interface ORSMainViewController ()

@property (nonatomic, strong) MIKMIDISequence *sequence;
@property (strong) IBOutlet NSArrayController *tracksController;
@property (strong) IBOutlet ORSMIDIEventsController *eventsController;
@property (strong) IBOutlet NSTableView *tracksTableView;
@property (strong) IBOutlet NSTableView *eventsTableView;

@end

@implementation ORSMainViewController

- (IBAction)loadMIDIFile:(id)sender
{
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	openPanel.allowsMultipleSelection = NO;
	openPanel.allowedFileTypes = @[@"mid", @"midi"];
	[openPanel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
		if (result != NSFileHandlingPanelOKButton) { return; }
		
		NSError *error = nil;
		MIKMIDISequence *sequence = [MIKMIDISequence sequenceWithFileAtURL:[openPanel URL] error:&error];
		if (!sequence) {
			[self presentError:error];
			return;
		}
		self.sequence = sequence;
	}];
}

- (IBAction)printEventDescription:(id)sender
{
	MIKMIDIEvent *event = [[self.eventsController selectedObjects] firstObject];
	if (!event) return;
	
	NSLog(@"%@", event);
}

- (IBAction)printTrackDescription:(id)sender
{
	MIKMIDITrack *track = [[self.tracksController selectedObjects] firstObject];
	if (!track) return;
	
	NSLog(@"%@", track);
}

- (void)setSequence:(MIKMIDISequence *)sequence
{
    if (sequence != _sequence) {
        _sequence = sequence;
        self.eventsController.sequence = sequence;
    }
}

@end
