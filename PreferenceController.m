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
  NSColor *color = [colorWell color];
  NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:colorAsData forKey:TLMTableBgColorKey];
}

- (IBAction)changeDefaultRate:(id)sender
{
  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:
    [NSNumber numberWithFloat:[defaultRate floatValue]]
                       forKey:TLMPersonRateKey];
}

- (IBAction)changeDefaultName:(id)sender
{
  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:[defaultName stringValue] forKey:TLMPersonNameKey];
}

- (NSColor *)tableBgColor
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSData *colorAsData = [defaults objectForKey:TLMTableBgColorKey];
  return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}

- (NSString *)personName
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  return [defaults stringForKey:TLMPersonNameKey];
}

- (NSNumber *)hourlyRate
{
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  return [defaults objectForKey:TLMPersonRateKey];
}

- (void)windowDidLoad
{
  [colorWell setColor:[self tableBgColor]];
  [defaultName setStringValue:[self personName]];
  [defaultRate setFloatValue:[[self hourlyRate] floatValue]];
}

@end
