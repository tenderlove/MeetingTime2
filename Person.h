//
//  Person.h
//  MeetingTime
//
//  Created by Aaron Patterson on 10/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Person : NSObject <NSCoding> {
  NSString *name;
  NSNumber *hourlyRate;
}

@property (readwrite, copy) NSString *name;
@property (readwrite, copy) NSNumber *hourlyRate;

- (Person *)initWithName:(NSString *)theName;
- (Person *)initWithName:(NSString *)theName hourlyRate:(NSNumber *)theRate;
- (void)encodeWithCoder:(NSCoder *)coder;
- (id)initWithCoder:(NSCoder *)coder;

@end
