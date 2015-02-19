//
//  Project.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "Project.h"

@implementation Project

-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey];
        self.entries = dictionary[entriesKey];
    }
    return self;
}

-(NSDictionary *)projectDictionary {
    NSMutableDictionary *projectDictionary = [NSMutableDictionary new];
    if (self.title){
        [projectDictionary setObject:self.title forKey:titleKey];
    }
    if (self.entries){
        [projectDictionary setObject:self.entries forKey:entriesKey];
    }
    return projectDictionary;
}

@end
