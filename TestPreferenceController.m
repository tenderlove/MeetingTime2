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

- (void)testWindow
{
  STAssertNotNil(window, @"window should not be nil");
}

- (void)testColorWell
{
  STAssertNotNil([preferenceController _colorWell], @"has colorWell");
}

- (void)testDefaultRate
{
  STAssertNotNil([preferenceController _defaultRate], @"has defaultRate");
}

- (void)testDefaultName
{
  STAssertNotNil([preferenceController _defaultName], @"has defaultName");
}


@end
