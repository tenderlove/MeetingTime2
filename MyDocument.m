//
//  MyDocument.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyDocument.h"
#import "Meeting.h"

@implementation MyDocument

@synthesize people;

- (id)init
{
  self = [super init];
  if (self) {
    meeting = [[Meeting alloc] init];
    people = [meeting people];
  }
  return self;
}

- (void)dealloc
{
  [self setPeople:nil];
  [super dealloc];
}

- (void)timerFired
{
  [runningTime setStringValue:
   [NSString stringWithFormat:@"%f seconds", [meeting runningInteval]]];
  [totalCost setStringValue:[NSString
           stringWithFormat:@"$%0.2f spent",
            [[meeting cost] floatValue]]];
}

- (IBAction)startButtonPressed:(id)sender
{
  [meeting reset];
  [meeting start];
  [startButton setEnabled:NO];
  [stopButton setEnabled:YES];

  SEL selector = @selector(timerFired);
  timer = [NSTimer timerWithTimeInterval:0
			target:self selector:selector userInfo:nil repeats:YES];
  [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (IBAction)stopButtonPressed:(id)sender
{
  [meeting stop];
  [startButton setEnabled:YES];
  [stopButton setEnabled:NO];
  [timer invalidate];
}

- (void)insertObject:(Person *)p inPeopleAtIndex:(int)index
{
  NSLog(@"adding %@ to %@", p, people);
  [people insertObject:p atIndex:index];
  [hourlyCost setFloatValue:[[meeting totalHourlyCost] floatValue]];
}

- (void)removeObjectFromPeopleAtIndex:(int)index
{
  Person *p = [people objectAtIndex:index];
  NSLog(@"removing %@ from %@", p, people);
  [people removeObjectAtIndex:index];
  [hourlyCost setFloatValue:[[meeting totalHourlyCost] floatValue]];
}

- (NSString *)windowNibName
{
  return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
  [super windowControllerDidLoadNib:aController];
  [hourlyCost setFloatValue:[[meeting totalHourlyCost] floatValue]];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
  if ( outError != NULL ) {
    *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
  }
  return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
  if ( outError != NULL ) {
    *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
  }
  return YES;
}

@end
