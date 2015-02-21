//
//  ViewController.m
//  ToDo
//
//  Created by Anthony Fennell on 2/20/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import "ViewController.h"
#import "TDTaskModel.h"
#import "TDTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TDTask *task = [[TDTaskModel sharedModel] createTaskNote:@"Get oil change" label:@"Oil"];
    NSLog(@"Task: %@ with label: %@", task.note, task.label);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
