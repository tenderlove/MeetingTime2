//
//  TestMyDocument.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestMyDocument.h"
#import "MyDocument_Private.h"


@implementation TestMyDocument
- (void)setUp
{
  _myDocument = [[MyDocument alloc] init];
  [_myDocument makeWindowControllers];
  window = [_myDocument windowForSheet];
}

- (void)tearDown
{
  [_myDocument release];
  window = nil;
}

- (void)testNibName
{
  NSString * name = [_myDocument windowNibName];
  STAssertEqualObjects(@"MyDocument", name, @"nib name was %@", name);
}

- (void)testWindowControllerLength
{
  STAssertEquals((NSUInteger)1, [[_myDocument windowControllers] count],
      @"oh noes!");
}

- (void)testStartButton
{
  STAssertNotNil([_myDocument _startButton], @"zomg should have button");
}

- (void)testPeople
{
  NSMutableArray * people = [_myDocument people];
  STAssertNotNil(people, @"People list should not be empty");
}

- (void)testWindowLoading {
  STAssertNotNil(window, @"The window should be connected");
}
@end
