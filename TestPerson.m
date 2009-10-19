//
//  TestPerson.m
//  MeetingTime
//
//  Created by Aaron Patterson on 10/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestPerson.h"
#import "Person.h"


@implementation TestPerson

- (void)testInitWithName
{
  Person * me = [[Person alloc] initWithName:@"Aaron"];
  STAssertEqualObjects(@"Aaron", [me name], @"name should be Aaron");
  [me release];
}

- (void)testSetName
{
  Person * me = [[Person alloc] initWithName:@"Aaron"];
  [me setName:@"Hello"];
  STAssertEqualObjects(@"Hello", [me name], @"name should be Hello");
  [me release];
}

- (void)testSetHourlyRate
{
  Person * me = [[Person alloc] initWithName:@"Aaron"];
  [me setHourlyRate:[NSNumber numberWithInt:12]];
  STAssertEqualObjects([NSNumber numberWithInt:12], [me hourlyRate],
      @"Hourly rate should be 12");
  [me release];
}

@end
