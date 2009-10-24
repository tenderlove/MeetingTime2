//
//  MyDocument.h
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <Cocoa/Cocoa.h>

@class Meeting;

@interface MyDocument : NSDocument
{
  NSMutableArray *people;
  Meeting *meeting;

  IBOutlet NSButton * startButton;
  IBOutlet NSButton * stopButton;

  IBOutlet NSTextField * runningTime;
  IBOutlet NSTextField * totalCost;
  IBOutlet NSTextField * hourlyCost;

  NSTimer * timer;
}

@property (readwrite, copy) NSMutableArray *people;

- (IBAction)startButtonPressed:(id)sender;
- (IBAction)stopButtonPressed:(id)sender;

@end
