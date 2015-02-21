//
//  Project.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "Project.h"

@interface Project ()

@property(nonatomic,strong)Entry *currentEntry;

@end

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
-(void)startNewEntry{
    Entry *entry = [Entry new];
    entry.startTime = [NSDate date];
    
    self.currentEntry = entry;
    
    [self addEntry:entry];
    
}

-(void)endCurrentEntry{
    self.currentEntry.endTime = [NSDate date];
    
}

-(void)addEntry:(Entry *)entry {
    NSMutableArray *projectEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [projectEntries addObject:entry];
    self.entries = projectEntries;
}

-(void)removeEntry:(Entry *)entry {
    NSMutableArray *projectEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [projectEntries removeObject:entry];
    self.entries = projectEntries;  //need to find indexPath selected to be removed
    
}


@end
