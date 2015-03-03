//
//  TDDetailViewController.h
//  ToDo
//
//  Created by Anthony Fennell on 3/2/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDTask;

@interface TDDetailViewController : UIViewController

@property (nonatomic, strong) TDTask *task;

@end
