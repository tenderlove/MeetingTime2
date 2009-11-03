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
