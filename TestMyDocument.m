//
//  TestMyDocument.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestMyDocument.h"


@implementation TestMyDocument
- (void)setUp {
  _myDocument = [[MyDocument alloc] init];
  [_myDocument makeWindowControllers];
  _window = [[_myDocument windowControllers] objectAtIndex:0];
}

- (void)tearDown {
  [_myDocument release];
  _window = nil;
}

- (void)testStartButton
{
  STAssertNotNil([_myDocument _startButton], @"zomg should have button");
}

- (void)testPeople
{
  NSMutableArray * people = [_myDocument _people];
  STAssertNotNil(people, @"People list should not be empty");
}

- (void)testWindowLoading {
  STAssertNotNil(_window, @"The window should be connected");
}
@end
