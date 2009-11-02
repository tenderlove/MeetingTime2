//
//  TestPreferenceController.h
//  MeetingTime2
//
//  Created by Aaron Patterson on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "PreferenceController.h"


@interface TestPreferenceController : SenTestCase {
  PreferenceController * preferenceController;
  NSWindow * window;
}

@end
