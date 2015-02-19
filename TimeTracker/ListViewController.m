//
//  ListViewController.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewDatasource.h"

#import "ProjectController.h"
#import "DetailViewController.h"

@interface ListViewController () <UITableViewDelegate>

@property(nonatomic, strong) ListTableViewDatasource *datasource;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ListViewController

-(instancetype)init
{
    self = [super init];
    {
        self.datasource = [ListTableViewDatasource new];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.datasource;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    Project *project = [ProjectController sharedInstance].projects[indexPath.row];
    
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.project = project;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
