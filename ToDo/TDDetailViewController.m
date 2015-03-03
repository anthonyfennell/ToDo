//
//  TDDetailViewController.m
//  ToDo
//
//  Created by Anthony Fennell on 3/2/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import "TDDetailViewController.h"
#import "TDTaskModel.h"

@interface TDDetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *notesField;

@end

@implementation TDDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.task) {
        self.titleField.text = self.task.label;
        self.notesField.text = self.task.note;
        self.datePicker.date = self.task.completionDate;
    } else {
        self.task = [[TDTaskModel sharedModel] createTaskNote:nil label:nil];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.task.label = self.titleField.text;
    self.task.note = self.notesField.text;
    self.task.completionDate = self.datePicker.date;
    [[TDTaskModel sharedModel] saveChanges];
}


#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
