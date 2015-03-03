//
//  TDTasksViewController.m
//  ToDo
//
//  Created by Anthony Fennell on 2/20/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import "TDTasksViewController.h"
#import "TDTaskModel.h"
#import "TDTask.h"

#import "TDDetailViewController.h"
#import "TDTaskTableViewCell.h"

static NSString * const segueToDetailView = @"segueToDetailView";

@interface TDTasksViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) TDTask *taskSelected;

@end



@implementation TDTasksViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:segueToDetailView] && self.taskSelected) {
        TDDetailViewController *detailVC = [segue destinationViewController];
        detailVC.task = self.taskSelected;
    }
}

#pragma mark - Initialization

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:TASK_CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:TASK_CELL_IDENTIFIER];
    self.tableView.rowHeight = TASK_CELL_HEIGHT;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.taskSelected = nil;
    [self.tableView reloadData];
}

#pragma mark - Button Tap

- (IBAction)addButtonTapped:(id)sender {
    [self performSegueWithIdentifier:segueToDetailView sender:self];
}

- (IBAction)editButtonTapped:(id)sender {
    
}



#pragma mark - Table View Delegate

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[TDTaskModel sharedModel] allTasks] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tasks = [[TDTaskModel sharedModel] allTasks];
    TDTask *task = tasks[indexPath.row];
    
    TDTaskTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:TASK_CELL_IDENTIFIER];
    cell.label.text = task.label;
    cell.note.text = task.note;
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tasks = [[TDTaskModel sharedModel] allTasks];
    self.taskSelected = tasks[indexPath.row];
    
    [self performSegueWithIdentifier:segueToDetailView sender:self];
}

@end
















