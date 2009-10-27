//
//  TestMyDocument.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestMyDocument.h"


@implementation TestMyDocument
- (void)setUp
{
  _myDocument = [[MyDocument alloc] init];
  [_myDocument makeWindowControllers];
  windowController = [[_myDocument windowControllers] objectAtIndex:0];
  window = [windowController window];
}

- (void)tearDown
{
  [_myDocument release];
  window = nil;
}

- (void)testWindowLoaded
{
  [windowController loadWindow];
  STAssertTrue([windowController isWindowLoaded], @"window should be loaded");
}

- (void)testOwner
{
  MyDocument * owner = [windowController owner];
  STAssertEqualObjects(_myDocument, owner, @"document should be", owner);
}

- (void)testNibName
{
  NSString * name = [windowController windowNibName];
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
  NSMutableArray * people = [_myDocument _people];
  STAssertNotNil(people, @"People list should not be empty");
}

- (void)testWindowLoading {
  STAssertNotNil(window, @"The window should be connected");
}
@end
