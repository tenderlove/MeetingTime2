//
//  PreferenceController_Private.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PreferenceController.h"
#import "PreferenceController_Private.h"

@implementation PreferenceController (PreferenceController_Private)

- (NSColorWell *)_colorWell
{
  return colorWell;
}

- (NSTextField *)_defaultRate
{
  return defaultRate;
}

- (NSTextField *)_defaultName
{
  return defaultName;
}

@end
