//
//  Person.m
//  MeetingTime
//
//  Created by Aaron Patterson on 10/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

- (Person *)initWithName:(NSString *)theName
{
  [super init];
  [self setName:theName];
  return self;
}

- (NSNumber *)hourlyRate
{
  return hourlyRate;
}

- (void)setHourlyRate:(NSNumber *)theRate
{
  [theRate retain];
  [hourlyRate release];
  hourlyRate = theRate;
}

- (NSString *)name
{
  return name;
}

- (void)setName:(NSString *)theName
{
  [theName retain];
  [name release];
  name = theName;
}

@end
