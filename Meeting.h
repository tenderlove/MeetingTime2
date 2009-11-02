//
//  Meeting.h
//  MeetingTime
//
//  Created by Aaron Patterson on 10/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"

@interface Meeting : NSObject {
  NSMutableArray *people;

  NSDate * startDate;
  NSDate * stopDate;
}

- (NSUInteger)count;
- (id)objectAtIndex:(int)i;
- (void)insertObject:(Person *)p atIndex:(int)i;
- (void)removeObjectAtIndex:(int)i;

@property (readwrite, copy) NSDate * startDate;
@property (readwrite, copy) NSDate * stopDate;
@property (assign) NSMutableArray * people;

- (void)start;
- (void)stop;
- (void)reset;
- (NSNumber *)cost;
- (NSTimeInterval)runningInteval;
- (void)encodeWithCoder:(NSCoder *)coder;
- (id)initWithCoder:(NSCoder *)coder;

@end
