//
//  AppController.h
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PreferenceController.h"

#define DEFAULT_NAME @"Bill"
#define DEFAULT_RATE 600

@interface AppController : NSObject {
  PreferenceController *preferenceController;
}
- (IBAction)showPreferencePanel:(id)sender;

@end
