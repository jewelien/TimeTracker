//
//  ProjectController.h
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface ProjectController : NSObject

@property (nonatomic, strong) NSArray *projects;

+(ProjectController *)sharedInstance;

-(void)addProject:(Project *)project;
-(void)removeProject:(Project *)project;

-(void)synchronize;

@end
