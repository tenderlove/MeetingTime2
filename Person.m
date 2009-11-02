//
//  Person.m
//  MeetingTime
//
//  Created by Aaron Patterson on 10/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name;
@synthesize hourlyRate;

- (id)init
{
  self = [super init];

  if(self) {
    [self initWithName:@"Someone"];
    [self setHourlyRate:[NSNumber numberWithInt:60]];
  }
  return self;
}

- (Person *)initWithName:(NSString *)theName
{
  self = [super init];

  if(self) {
    [self setName:theName];
    [self setHourlyRate:[NSNumber numberWithInt:60]];
  }

  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:name forKey:@"name"];
  [coder encodeObject:hourlyRate forKey:@"hourlyRate"];
}

- (id)initWithCoder:(NSCoder *)coder
{
  self = [super init];
  if(self) {
    [self setName:[coder decodeObjectForKey:@"name"]];
    [self setHourlyRate:[coder decodeObjectForKey:@"hourlyRate"]];
  }
  return self;
}

- (void)dealloc
{
  [self setName:nil];
  [self setHourlyRate:nil];
  [super dealloc];
}

@end
