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

- (Person *)initWithName:(NSString *)theName
{
  [super init];
  [self setName:theName];
  return self;
}

@end
