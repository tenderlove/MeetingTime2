//
//  Meeting.m
//  MeetingTime
//
//  Created by Aaron Patterson on 10/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Meeting.h"


@implementation Meeting

@synthesize startDate;
@synthesize stopDate;
@synthesize people;

- (id)init
{
  self = [super init];

  if(self) {
    self.people = [[NSMutableArray alloc] init];
    [people addObject:[[Person alloc] initWithName:@"Fred"]];
    [people addObject:[[Person alloc] initWithName:@"Aaron"]];
    [people addObject:[[Person alloc] initWithName:@"Ebi"]];
    [people addObject:[[Person alloc] initWithName:@"John"]];
  }

  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:people forKey:@"people"];
}

- (id)initWithCoder:(NSCoder *)coder
{
  self = [super init];
  if(self) {
    [self setPeople:[coder decodeObjectForKey:@"people"]];
  }
  return self;
}

- (id)objectAtIndex:(int)i
{
  return [people objectAtIndex:i];
}

- (void)insertObject:(Person *)p atIndex:(int)i
{
  [people insertObject:p atIndex:i];
}

- (void)removeObjectAtIndex:(int)i
{
  [people removeObjectAtIndex:i];
}

- (NSUInteger)count
{
  return [people count];
}

- (NSTimeInterval)runningInteval
{
  NSDate * ending = [self stopDate] ? [self stopDate] : [NSDate date];
  NSTimeInterval secondsRunning =
    -1 * [[self startDate] timeIntervalSinceDate:ending];
  return secondsRunning;
}

- (NSNumber *)cost
{
  if(nil == [self startDate]) return [NSNumber numberWithFloat:0.0];

  float totalHourly =
    [[self valueForKeyPath:@"people.@sum.hourlyRate"] floatValue];
  float spent = [self runningInteval] * totalHourly / 3600.0;

  return [NSNumber numberWithFloat:spent];
}

- (void)start
{
  [self setStartDate:[NSDate date]];
}

- (void)stop
{
  [self setStopDate:[NSDate date]];
}

- (void)reset
{
  [self setStopDate:nil];
  [self setStartDate:nil];
}

- (void)dealloc
{
  [self setPeople:nil];
  [self setStopDate:nil];
  [self setStartDate:nil];
  [super dealloc];
}

@end
