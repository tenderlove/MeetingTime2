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
    self.people = [meeting people];
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
  NSUndoManager * undo = [self undoManager];

  [[undo prepareWithInvocationTarget:self]
       removeObjectFromPeopleAtIndex:index];

  if(![undo isUndoing]) {
    [undo setActionName:@"Insert Person"];
  }

  [self startObservingPerson:p];
  [people insertObject:p atIndex:index];
}

- (void)removeObjectFromPeopleAtIndex:(int)index
{
  Person *p = [people objectAtIndex:index];

  NSUndoManager * undo = [self undoManager];
  [[undo prepareWithInvocationTarget:self] insertObject:p
                     inPeopleAtIndex:index];

  if(![undo isUndoing]) {
    [undo setActionName:@"Delete Person"];
  }
  [self stopObservingPerson:p];
  [people removeObjectAtIndex:index];
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

- (void)startObservingPerson:(Person *)person
{
  [person addObserver:self
           forKeyPath:@"name"
              options:NSKeyValueObservingOptionOld
              context:NULL];

  [person addObserver:self
           forKeyPath:@"hourlyRate"
              options:NSKeyValueObservingOptionOld
              context:NULL];
}

- (void)stopObservingPerson:(Person *)person
{
  [person removeObserver:self forKeyPath:@"name"];
  [person removeObserver:self forKeyPath:@"hourlyRate"];
}

- (void)changeKeyPath:(NSString *)keyPath
             ofObject:(id)obj
              toValue:(id)newValue
{
  [obj setValue:newValue forKeyPath:keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
  NSUndoManager * undo = [self undoManager];
  id oldValue = [change objectForKey:NSKeyValueChangeOldKey];

  if(oldValue == [NSNull null]) oldValue = nil;

  [[undo prepareWithInvocationTarget:self] changeKeyPath:keyPath
                            ofObject:object
                             toValue:oldValue];
  [undo setActionName:@"Edit"];
}

- (void)setPeople:(NSMutableArray *)thePeople
{
  if(people == thePeople) return;

  for (Person *person in people) {
    [self stopObservingPerson:person];
  }

  [thePeople retain];
  [people release];
  people = thePeople;

  for (Person *person in people) {
    [self startObservingPerson:person];
  }
}

@end
