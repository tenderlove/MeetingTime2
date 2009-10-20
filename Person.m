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
  [super init];
  [self initWithName:@"Someone"];
  [self setHourlyRate:[NSNumber numberWithInt:60]];
  return self;
}

- (Person *)initWithName:(NSString *)theName
{
  [super init];
  [self setName:theName];
  return self;
}

- (void)dealloc
{
  [self setName:nil];
  [self setHourlyRate:nil];
  [super dealloc];
}

@end
