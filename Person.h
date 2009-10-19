//
//  Person.h
//  MeetingTime
//
//  Created by Aaron Patterson on 10/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Person : NSObject {
  NSString *name;
  NSNumber *hourlyRate;
}

@property (readwrite, copy) NSString *name;
@property (readwrite, copy) NSNumber *hourlyRate;

- (Person *)initWithName:(NSString *)theName;

@end
