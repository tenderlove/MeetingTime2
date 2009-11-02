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

- (NSString *)windowNibName
{
  return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
{
  [super windowControllerDidLoadNib:aController];
}

- (NSData *)dataOfType:(NSString *)typeName
                 error:(NSError **)outError
{
  [[tableView window] endEditingFor:nil];

  return [NSKeyedArchiver archivedDataWithRootObject:people];
}

- (void)insertObject:(Person *)p inPeopleAtIndex:(int)index
{
  [people insertObject:p atIndex:index];
  NSUndoManager * undo = [self undoManager];

  [[undo prepareWithInvocationTarget:self]
       removeObjectFromPeopleAtIndex:index];

  if(![undo isUndoing]) {
    [undo setActionName:@"Insert Person"];
  }
}

- (void)removeObjectFromPeopleAtIndex:(int)index
{
  Person *p = [people objectAtIndex:index];
  [people removeObjectAtIndex:index];

  NSUndoManager * undo = [self undoManager];
  [[undo prepareWithInvocationTarget:self] insertObject:p
                     inPeopleAtIndex:index];

  if(![undo isUndoing]) {
    [undo setActionName:@"Delete Person"];
  }
}

- (BOOL)readFromData:(NSData *)data
              ofType:(NSString *)typeName
               error:(NSError **)outError
{
  NSMutableArray * newList = nil;
  @try {
    newList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
  }
  @catch (NSException *e) {
    if(outError) {
      NSDictionary *d = [NSDictionary
        dictionaryWithObject:@"The data is corrupted"
                      forKey:NSLocalizedFailureReasonErrorKey];
      *outError = [NSError errorWithDomain:NSOSStatusErrorDomain
                                      code:unimpErr
                                  userInfo:d];
    }
    return NO;
  }

  [self setPeople:newList];
  return YES;
}

@end
