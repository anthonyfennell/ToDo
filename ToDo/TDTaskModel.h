//
//  TDTaskModel.h
//  ToDo
//
//  Created by Anthony Fennell on 2/20/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDTask.h"

@interface TDTaskModel : NSObject

+ (instancetype)sharedModel;

/// Create a task
- (TDTask *)createTaskNote:(NSString *)note label:(NSString *)label;
/// Remove a task
- (void)removeTaskNote:(TDTask *)task;

/// All Tasks in order by completion date
- (NSArray *)allTasks;

/// Save changes to CoreData
- (void)saveChanges;


@end
