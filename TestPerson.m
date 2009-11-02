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

- (void)testCoder
{
  NSMutableData * data = [[NSMutableData alloc] init];

  Person * me = [[Person alloc] initWithName:@"Aaron"];
  NSKeyedArchiver * writer = [[NSKeyedArchiver alloc]
    initForWritingWithMutableData:data];

  [me encodeWithCoder:writer];
  [writer finishEncoding];

  NSCoder * reader = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];

  Person * copy = [[Person alloc] initWithCoder:reader];

  STAssertEqualObjects([me name], [copy name], @"name should equal %@",
      [me name]);
  STAssertEqualObjects([me hourlyRate], [copy hourlyRate],
      @"rate should equal %@", [me hourlyRate]);
}

- (void)testInitWithName
{
  Person * me = [[Person alloc] initWithName:@"Aaron"];
  STAssertEqualObjects(@"Aaron", [me name], @"name should be Aaron");
  [me release];
}

- (void)testDefaultInit
{
  Person *me = [[Person alloc] init];
  STAssertEqualObjects(@"Someone", [me name], @"name should be Someone");
  STAssertEqualObjects([NSNumber numberWithInt:60], [me hourlyRate], @"hourly rate should be awesome");
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
