//
//  MyDocument.h
//  MeetingTime2
//
//  Created by Aaron Patterson on 10/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument
{
  NSMutableArray *people;
}

@property (readwrite, copy) NSMutableArray *people;

@end
