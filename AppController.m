//
//  AppController.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (IBAction)showPreferencePanel:(id)sender
{
  if(!preferenceController)
    preferenceController = [[PreferenceController alloc] init];

  [preferenceController showWindow:self];
}

@end
