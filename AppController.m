//
//  AppController.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"


@implementation AppController

+(void)initialize
{
  NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
  NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:
    [NSColor yellowColor]];

  [defaultValues setObject:colorAsData forKey:TLMTableBgColorKey];
  [defaultValues setObject:@"Bill" forKey:TLMPersonNameKey];
  [defaultValues setObject:[NSNumber numberWithInt:600]
                    forKey:TLMPersonRateKey];

  [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
}

- (IBAction)showPreferencePanel:(id)sender
{
  if(!preferenceController)
    preferenceController = [[PreferenceController alloc] init];

  [preferenceController showWindow:self];
}

@end
