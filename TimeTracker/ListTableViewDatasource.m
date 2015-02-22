//
//  ListTableViewDatasource.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ListTableViewDatasource.h"
#import "ProjectController.h"

static NSString *listCell = @"listCell";

@implementation ListTableViewDatasource

//- (void)registerTableView:(UITableView *)tableView {
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:listCell];
//}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ProjectController sharedInstance].projects.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:listCell];
    }
    
    Project *project = [ProjectController sharedInstance].projects[indexPath.row];
    cell.textLabel.text = project.title;
//    cell.detailTextLabel.text = project.projectTime;
    
    return cell;
}
@end
