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

-(void)addEntry:(Entry *)entries;
-(void)removeEntry:(Entry *)entries;




@end
