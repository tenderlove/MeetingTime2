//
//  PreferenceController.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PreferenceController.h"

NSString * const TLMTableBgColorKey = @"TableBackgroundColor";
NSString * const TLMPersonNameKey   = @"PersonNameKey";
NSString * const TLMPersonRateKey   = @"PersonRateKey";

@implementation PreferenceController

- (id)init
{
  if(![super initWithWindowNibName:@"Preferences"])
    return nil;
  return self;
}

- (IBAction)changeBackgroundColor:(id)sender
{
}

- (IBAction)changeDefaultRate:(id)sender
{
}

- (IBAction)changeDefaultName:(id)sender
{
}

@end
