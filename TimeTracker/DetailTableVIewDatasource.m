//
//  DetailTableVIewDatasource.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DetailTableVIewDatasource.h"

static NSString *entryCell = @"entryCell";

@implementation DetailTableVIewDatasource

-(void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:entryCell];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.project.entries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:entryCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:entryCell];
    }
    Entry *entry = [self.project entries][indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ -%@", entry.startTime, entry.endTime];
    
    return cell;
}

@end
