//
//  TestMyDocument.h
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "MyDocument.h"
#import "MyDocument_Private.h"


@interface TestMyDocument : SenTestCase {
  MyDocument * _myDocument;
  NSWindow * _window;
}

@end