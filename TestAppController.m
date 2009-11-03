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

  STAssertEqualObjects(@"Bill", [defaults stringForKey:TLMPersonNameKey],
      @"Default name is Bill");

  NSNumber * defaultRate = [NSNumber numberWithInt:600];

  STAssertEqualObjects(defaultRate, [defaults objectForKey:TLMPersonRateKey],
      @"Default name is Bill");
}

@end
