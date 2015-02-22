//
//  Project.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "Project.h"
#import "ProjectController.h"

static NSString *titleKey = @"title";
static NSString *entriesKey = @"entries";


@interface Project ()

@property(nonatomic,strong)Entry *currentEntry;

@end

@implementation Project


-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey];
        NSMutableArray *entries = [NSMutableArray new];
        for (NSDictionary *entry in dictionary[entriesKey]) {
            [entries addObject:[[Entry alloc] initWithDictionary:entry]];
        }
        self.entries = entries;
    }
    return self;
}

-(NSDictionary *)projectDictionary {
    NSMutableDictionary *projectDictionary = [NSMutableDictionary new];
    if (self.title){
        [projectDictionary setObject:self.title forKey:titleKey];
    }

    NSMutableArray *entries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entries addObject:[entry entryDictionary]];
    }
    [projectDictionary setObject:entries forKey:entriesKey];
    
    return projectDictionary;
}


-(void)synchronize {
    [[ProjectController sharedInstance] synchronize];
}

//???
//- (void)setEntries:(NSArray *)entries {
//    _entries = entries;
//
//    [self synchronize];
//}

-(void)startNewEntry{
    Entry *entry = [Entry new];
    entry.startTime = [NSDate date];
    
    self.currentEntry = entry;
    
    [self addEntry:entry];
    
}

-(void)endCurrentEntry{
    self.currentEntry.endTime = [NSDate date];
    [self synchronize];
}

-(void)addEntry:(Entry *)entry {
    NSMutableArray *projectEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [projectEntries addObject:entry];
    self.entries = projectEntries;
}

-(void)removeEntry:(Entry *)entry {
    NSMutableArray *projectEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [projectEntries removeObject:entry];
    self.entries = projectEntries;      
}


-(NSString *)projectTime {
    NSInteger hours = 0;
    NSInteger minutes = 0;
    for (Entry *entry in self.entries) {
        NSTimeInterval totalSeconds = [entry.endTime timeIntervalSinceDate:entry.startTime];
        
        double secondsInHour = 3600;
        NSInteger totalHours = totalSeconds / secondsInHour;
        
        double secondsInMinute = 60;
        NSInteger totalMinutes = (totalSeconds - (totalHours * secondsInHour)) / secondsInMinute;
        
        hours += totalHours;
        minutes += totalMinutes;
    }
    

    NSString *hoursString = hours < 10 ? [NSString stringWithFormat:@"0%ld", hours] : [NSString stringWithFormat:@"%ld", hours];
    NSString *minutesString = minutes < 10 ? [NSString stringWithFormat:@"0%ld", minutes] : [NSString stringWithFormat:@"%ld", minutes];
    
    return [NSString stringWithFormat:@"%@:%@",hoursString, minutesString];
}


@end
