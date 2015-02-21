//
//  DetailViewController.m
//  TimeTracker
//
//  Created by Julien Guanzon on 2/19/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DetailViewController.h"
#import "ProjectController.h"
#import "CustomEntryViewController.h"

@interface DetailViewController () <UITextFieldDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) DetailTableVIewDatasource *datasource;

@end

@implementation DetailViewController

-(instancetype)init{
    self = [super init];{
        self.datasource = [DetailTableVIewDatasource new];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];
    self.textField.text = self.project.title;
    self.textField.delegate = self;
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self.datasource;
    self.datasource.project = self.project;
    [self.datasource registerTableView:self.tableView];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}



- (IBAction)addButtonPressed:(id)sender {
    CustomEntryViewController *customEntryViewController = [CustomEntryViewController new];
    customEntryViewController.project = self.project;
    [self presentViewController:customEntryViewController animated:YES completion:nil];
    
}
- (IBAction)inButtonPressed:(id)sender {
    [self.project startNewEntry];
    [self.tableView reloadData];
}
- (IBAction)outButtonPressed:(id)sender {
    [self.project endCurrentEntry];
    [self.tableView reloadData];
}
- (IBAction)reportButtonPressed:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    self.project.title = textField.text;
    [[ProjectController sharedInstance]synchronize];
    return YES;
    
    
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
