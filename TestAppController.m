//
//  TestAppController.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TestAppController.h"
#import "AppController.h"


@implementation TestAppController

- (void)setup
{
  [NSUserDefaults resetStandardUserDefaults];
}

- (void)tearDown
{
  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
  [defaults removeObjectForKey:TLMTableBgColorKey];
  [defaults removeObjectForKey:TLMPersonNameKey];
  [defaults removeObjectForKey:TLMPersonRateKey];
}

- (void)testInitializeDefaults
{
  [AppController initialize];

  NSColor * defaultColor = [NSColor yellowColor];
  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
  NSData *colorAsData = [defaults objectForKey:TLMTableBgColorKey];

  STAssertNotNil(colorAsData, @"should have color");
  STAssertEqualObjects(defaultColor,
      [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData],
      @"Should have bgcolor default");

  STAssertEqualObjects(DEFAULT_NAME, [defaults stringForKey:TLMPersonNameKey],
      @"Default name is Bill");

  NSNumber * defaultRate = [NSNumber numberWithInt:DEFAULT_RATE];

  STAssertEqualObjects(defaultRate, [defaults objectForKey:TLMPersonRateKey],
      @"Default rate is set");
}

@end
