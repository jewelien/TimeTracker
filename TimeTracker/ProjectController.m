//
//  ProjectController.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ProjectController.h"
#import "Project.h"

static NSString *projectKey = @"project";


@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ProjectController new];
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

///???
//-(void)setProjects:(NSArray*)projects {
//    _projects = projects;
//    [self synchronize];
//}


-(void)loadFromDefaults {
    NSArray *projectDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:projectKey];
    NSMutableArray *projects = [NSMutableArray new];
    for (NSDictionary *project in projectDictionaries) {
        [projects addObject:[[Project alloc] initWithDictionary:project]];
    }
    self.projects = projects;
}

-(void)synchronize {
    NSMutableArray *projectDictionaries = [NSMutableArray new];
    for (Project *project in self.projects) {
        [projectDictionaries addObject:[project projectDictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:projectDictionaries forKey:projectKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(void)addProject:(Project *)project {
    NSMutableArray *projectsList = [[NSMutableArray alloc] initWithArray:self.projects];
    [projectsList addObject:project];
    self.projects = projectsList;
    
}
-(void)removeProject:(Project *)project {
    NSMutableArray *projectsList = [[NSMutableArray alloc] initWithArray:self.projects];
    [projectsList removeObject:project];
    self.projects = projectsList;
}

@end
