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
  myDocument = [[MyDocument alloc] init];
  [myDocument makeWindowControllers];
  window = [myDocument windowForSheet];
}

- (void)tearDown
{
  [myDocument release];
  window = nil;
}

- (void)testArchive
{
  NSData * data = [myDocument dataOfType:@"whatevs" error:nil];
  STAssertNotNil(data, @"data should not be nil");
}

- (void)testTableView
{
  STAssertNotNil([myDocument _tableView], @"should have table view");
}

- (void)testNibName
{
  NSString * name = [myDocument windowNibName];
  STAssertEqualObjects(@"MyDocument", name, @"nib name was %@", name);
}

- (void)testWindowControllerLength
{
  STAssertEquals((NSUInteger)1, [[myDocument windowControllers] count],
      @"oh noes!");
}

- (void)testStartButton
{
  STAssertNotNil([myDocument _startButton], @"zomg should have button");
}

- (void)testPeople
{
  NSMutableArray * people = [myDocument people];
  STAssertNotNil(people, @"People list should not be empty");
}

- (void)testWindowLoading {
  STAssertNotNil(window, @"The window should be connected");
}
@end
