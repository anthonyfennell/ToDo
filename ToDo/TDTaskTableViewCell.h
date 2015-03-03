//
//  TDTaskTableViewCell.h
//  ToDo
//
//  Created by Anthony Fennell on 3/2/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TASK_CELL_IDENTIFIER @"TDTaskTableViewCell"
#define TASK_CELL_HEIGHT 55

@interface TDTaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *note;

@end
