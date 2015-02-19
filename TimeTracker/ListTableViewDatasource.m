//
//  ListTableViewDatasource.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ListTableViewDatasource.h"
#import "ProjectController.h"
#import "Project.h"

@implementation ListTableViewDatasource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ProjectController sharedInstance].projects.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    Project *project = [ProjectController sharedInstance].projects[indexPath.row];
    cell.textLabel.text = project.title;
    return cell;
}
@end
