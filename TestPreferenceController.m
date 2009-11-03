//
//  TestPreferenceController.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestPreferenceController.h"
#import "PreferenceController_Private.h"

@implementation TestPreferenceController

- (void)setUp
{
  preferenceController = [[PreferenceController alloc] init];
  window = [preferenceController window];
}

- (void)tearDown
{
  [preferenceController release];
  window = nil;
}

- (void)testColorWellUsesDefault
{
  NSColorWell * colorWell = [preferenceController _colorWell];

  STAssertEqualObjects([preferenceController tableBgColor],
      [colorWell color], @"color well should use defaults");
}

- (void)testPersonNameUsesDefault
{
  STAssertEqualObjects(@"Bill", [preferenceController personName],
      @"should return default");
  NSTextField * name = [preferenceController _defaultName];
  STAssertEqualObjects([preferenceController personName],
      [name stringValue],
      @"default name should be set from prefs");
}

- (void)testRateUsesDefault
{
  NSNumber * defaultRate = [NSNumber numberWithInt:600];

  STAssertEqualObjects(defaultRate, [preferenceController hourlyRate],
      @"should return default");

  NSTextField * rate = [preferenceController _defaultRate];
  STAssertEquals(600, [rate intValue],
      @"default name should be set from prefs");
}

- (void)testPreferencesConnected
{
  NSApplication * app = [NSApplication sharedApplication];
  NSMenu * mainMenu = [app mainMenu];
  STAssertNotNil(mainMenu, @"should have a main menu");

  NSMenuItem * appItem = [mainMenu itemAtIndex:0];
  STAssertNotNil(appItem, @"should have an app item");

  NSMenu * submenu = [appItem submenu];
  NSMenuItem * prefs = [submenu itemWithTitle:@"Preferences…"];
  STAssertNotNil(prefs, @"should have prefs item");
  STAssertEquals([prefs action], @selector(showPreferencePanel:),
                 @"Should set the -showPreferencePanel: action");
}

- (void)testWindow
{
  STAssertNotNil(window, @"window should not be nil");
}

- (void)testColorWell
{
  NSColorWell * colorWell = [preferenceController _colorWell];
  STAssertNotNil(colorWell, @"has colorWell");
  STAssertEquals([colorWell action], @selector(changeBackgroundColor:),
                 @"Should set the -changeBackgroundColor: action");
}

- (void)testDefaultRate
{
  NSTextField * defaultRate = [preferenceController _defaultRate];
  STAssertNotNil(defaultRate, @"has defaultRate");
  STAssertEquals([defaultRate action], @selector(changeDefaultRate:),
                 @"Should set the -changeDefaultRate: action");
}

- (void)testDefaultName
{
  NSTextField * defaultName = [preferenceController _defaultName];
  STAssertNotNil(defaultName, @"has defaultName");
  STAssertEquals([defaultName action], @selector(changeDefaultName:),
                 @"Should set the -changeDefaultName: action");
}


@end
