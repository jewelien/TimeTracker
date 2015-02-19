//
//  DetailTableVIewDatasource.h
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Project.h"

@interface DetailTableVIewDatasource : NSObject <UITableViewDataSource>

@property (nonatomic, strong)Project *project;



@end
