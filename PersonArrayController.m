//
//  PersonArrayController.m
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonArrayController.h"
#import "PreferenceController.h"
#import "Person.h"

@implementation PersonArrayController

- (void)add:(id)sender
{
  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];

  NSNumber * defaultRate = [defaults objectForKey:TLMPersonRateKey];
  NSString * defaultName = [defaults objectForKey:TLMPersonNameKey];

  Person * peep = [[Person alloc] initWithName:defaultName
                                    hourlyRate:defaultRate];
  [self addObject:peep];
}

@end
