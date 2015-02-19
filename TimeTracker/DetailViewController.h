//
//  DetailViewController.h
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Project.h"
#import "DetailTableVIewDatasource.h"
@interface DetailViewController : UIViewController

@property (nonatomic, strong) Project *project;
@property (nonatomic, strong) DetailTableVIewDatasource *datasource;




@end
