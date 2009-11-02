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

- (void)testUnarchive
{
  NSData * data = [myDocument dataOfType:@"whatevs" error:nil];
  NSUInteger before = [[myDocument people] count];

  [myDocument setPeople:[[NSArray alloc] init]];
  STAssertEquals((NSUInteger)0,
      [[myDocument people] count], @"count should be 0");
  BOOL ret = [myDocument readFromData:data
                               ofType:@"whateves"
                                error:nil];
  STAssertTrue(ret, @"ret should be true");
  STAssertEquals(before, [[myDocument people] count], @"count should be 4");
}

/* FIXME: how to make this thing pass??
- (void)testUnarchiveWithError
{
  NSError * error = nil;
  BOOL ret = [myDocument readFromData:[[NSMutableData alloc] init]
                               ofType:@"whateves"
                                error:&error];
  STAssertTrue(!ret, @"ret should be false");
  STAssertNotNil(error, @"error is not nil");
}
*/

- (void)testUndoInsert
{
  Person * me = [[Person alloc] initWithName:@"Aaron"];
  NSUInteger before = [[myDocument people] count];
  [myDocument insertObject:me inPeopleAtIndex:0];
  STAssertEquals(before + 1, [[myDocument people] count], @"count changed");

  NSUndoManager * undo = [myDocument undoManager];
  STAssertEqualObjects(@"Insert Person", [undo undoActionName],
      @"action name was %@", [undo undoActionName]);

  [undo undo];
  STAssertEquals(before, [[myDocument people] count], @"count should change");
}

- (void)testUndoRemove
{
  NSUInteger before = [[myDocument people] count];

  [myDocument removeObjectFromPeopleAtIndex:0];
  STAssertEquals(before - 1, [[myDocument people] count], @"count should change");

  NSUndoManager * undo = [myDocument undoManager];
  STAssertEqualObjects(@"Delete Person", [undo undoActionName],
      @"action name was %@", [undo undoActionName]);

  [undo undo];
  STAssertEquals(before, [[myDocument people] count], @"count should change");
}

- (void)testUndoKeyPath
{
  Person * first = [[myDocument people] objectAtIndex:0];

  NSString * before = [first name];

  [myDocument changeKeyPath:@"name"
                   ofObject:first
                    toValue:@"Hungry"];
  STAssertEqualObjects(@"Hungry", [first name], @"first name should be Hungry");

  NSUndoManager * undo = [myDocument undoManager];
  STAssertEqualObjects(@"Edit", [undo undoActionName], @"action name was %@",
      [undo undoActionName]);

  [undo undo];
  STAssertEqualObjects(before, [first name], @"name should change");
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
