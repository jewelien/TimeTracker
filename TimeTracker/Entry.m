//
//  Entry.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "Entry.h"

static NSString *startTimeKey = @"startTime";
static NSString *endTimeKey = @"endTimeKey";

@implementation Entry


-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];  //??
    if (self) {
        self.startTime = dictionary[startTimeKey];
        self.endTime = dictionary[endTimeKey];
    }
    return self;
}

-(NSDictionary *)entryDictionary{
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.startTime) {
        [entryDictionary setObject:self.startTime forKey:startTimeKey];
    }
    if (self.endTime) {
        [entryDictionary setObject:self.endTime forKey:endTimeKey];
    }
    return entryDictionary;
}


@end
