//
//  MyDocument.h
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <Cocoa/Cocoa.h>

@class Meeting;

@interface MyDocument : NSDocument
{
  NSMutableArray *people;
  Meeting *meeting;
}

@property (readwrite, copy) NSMutableArray *people;

@end
