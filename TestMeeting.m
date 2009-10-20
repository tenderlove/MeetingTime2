//
//  TestMeeting.m
//  MeetingTime
//
//  Created by Aaron Patterson on 10/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestMeeting.h"
#import "Meeting.h"
#import "Person.h"


@implementation TestMeeting

- (void)testInit
{
  Meeting * m = [[Meeting alloc] init];
  STAssertNotNil([m objectAtIndex:0], @"attendee should not be nil");
  STAssertNotNil([m objectAtIndex:1], @"attendee should not be nil");
  STAssertNotNil([m objectAtIndex:2], @"attendee should not be nil");
  STAssertNotNil([m objectAtIndex:3], @"attendee should not be nil");
  [m release];
}

- (void)testStartDate
{
  NSDate * d = [NSDate date];
  Meeting * m = [[Meeting alloc] init];
  [m setStartDate:d];
  STAssertEqualObjects(d, [m startDate], @"dates should be equal");
  [m release];
}

- (void)testStartDateRelease
{
  NSDate * d = [NSDate date];
  Meeting * m = [[Meeting alloc] init];
  [m setStartDate:d];

  NSUInteger count = [d retainCount];
  [m release];
  STAssertEquals(count - 1, [d retainCount],
      @"retain count should be decremented");
}

- (void)testStart
{
  Meeting * m = [[Meeting alloc] init];
  STAssertNil([m startDate], @"start date should be nil");
  [m start];
  STAssertNotNil([m startDate], @"start date should not be nil");
  [m release];
}

- (void)testStop
{
  Meeting * m = [[Meeting alloc] init];
  STAssertNil([m stopDate], @"end date should be nil");
  [m stop];
  STAssertNotNil([m stopDate], @"end date should not be nil");
  [m release];
}

- (void)testCostNotStarted
{
  Meeting * m = [[Meeting alloc] init];
  NSNumber * zero = [[NSNumber numberWithInt:0] retain];

  STAssertEqualObjects(zero, [m cost], @"cost should be 0");
}

- (void)testCostStarted
{
  Meeting * m = [[Meeting alloc] init];
  NSNumber * zero = [[NSNumber numberWithInt:0] retain];

  [m start];
  STAssertEqualObjects(zero, [m cost], @"cost should be 0");
}

- (void)testReset
{
  Meeting * m = [[Meeting alloc] init];
  [m start];
  STAssertNotNil([m startDate], @"startDate should not be nil");
  [m reset];
  STAssertNil([m startDate], @"startDate should be nil");
}

@end
