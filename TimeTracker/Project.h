//
//  Project.h
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"


@interface Project : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSArray *entries;

-(void)startNewEntry;
-(void)endCurrentEntry;

-(void)addEntry:(Entry *)entry;
-(void)removeEntry:(Entry *)entry;

-(id)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)projectDictionary;

-(NSString *)projectTime;

-(void)synchronize;

@end
