//
//  PreferenceController.h
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const TLMTableBgColorKey;
extern NSString * const TLMPersonNameKey;
extern NSString * const TLMPersonRateKey;

@interface PreferenceController : NSWindowController {
  IBOutlet NSColorWell *colorWell;
  IBOutlet NSTextField *defaultRate;
  IBOutlet NSTextField *defaultName;
}
- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeDefaultRate:(id)sender;
- (IBAction)changeDefaultName:(id)sender;

@end
