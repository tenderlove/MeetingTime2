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
  [NSUserDefaults resetStandardUserDefaults];
  preferenceController = [[PreferenceController alloc] init];
  window = [preferenceController window];
}

- (void)tearDown
{
  [preferenceController release];
  window = nil;

  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
  [defaults removeObjectForKey:TLMTableBgColorKey];
  [defaults removeObjectForKey:TLMPersonNameKey];
  [defaults removeObjectForKey:TLMPersonRateKey];
}

- (void)testColorWellUsesDefault
{
  NSColorWell * colorWell = [preferenceController _colorWell];

  STAssertEqualObjects([preferenceController tableBgColor],
      [colorWell color], @"color well should use defaults");
}

- (void)testPersonNameUsesDefault
{
  STAssertEqualObjects(DEFAULT_NAME, [preferenceController personName],
      @"should return default");
  NSTextField * name = [preferenceController _defaultName];
  STAssertEqualObjects([preferenceController personName],
      [name stringValue],
      @"default name should be set from prefs");
}

- (void)testRateUsesDefault
{
  [NSUserDefaults resetStandardUserDefaults];
  NSNumber * defaultRate = [NSNumber numberWithInt:DEFAULT_RATE];

  STAssertEqualObjects(defaultRate, [preferenceController hourlyRate],
      @"should return default");

  NSTextField * rate = [preferenceController _defaultRate];
  STAssertEquals(DEFAULT_RATE, [rate intValue],
      @"default rate should be set from prefs");
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

- (void)testChangeBackgroundColor
{
  NSColor * green = [NSColor greenColor];
  NSColorWell * colorWell = [preferenceController _colorWell];
  [colorWell setColor:green];

  [preferenceController changeBackgroundColor:nil];
  STAssertEqualObjects(green, [preferenceController tableBgColor],
      @"color should be green");
}

- (void)testDefaultRate
{
  NSTextField * defaultRate = [preferenceController _defaultRate];
  STAssertNotNil(defaultRate, @"has defaultRate");
  STAssertEquals([defaultRate action], @selector(changeDefaultRate:),
                 @"Should set the -changeDefaultRate: action");
}

- (void)testChangeDefaultRate
{
  NSTextField * defaultRate = [preferenceController _defaultRate];
  [defaultRate setStringValue:@"100"];

  [preferenceController changeDefaultRate:nil];
  STAssertEqualObjects([NSNumber numberWithInt:100],
      [preferenceController hourlyRate], @"rate should be 100");
}

- (void)testDefaultName
{
  NSTextField * defaultName = [preferenceController _defaultName];
  STAssertNotNil(defaultName, @"has defaultName");
  STAssertEquals([defaultName action], @selector(changeDefaultName:),
                 @"Should set the -changeDefaultName: action");
}

- (void)testChangeDefaultName
{
  NSTextField * defaultName = [preferenceController _defaultName];
  [defaultName setStringValue:@"Aaron"];

  [preferenceController changeDefaultName:nil];
  STAssertEqualObjects(@"Aaron",
      [preferenceController personName], @"name should be Aaron");
}


@end
