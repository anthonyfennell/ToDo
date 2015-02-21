//
//  TDTaskModel.m
//  ToDo
//
//  Created by Anthony Fennell on 2/20/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import "TDTaskModel.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

#import "TDTask.h"

@interface TDTaskModel ()
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

@end

@implementation TDTaskModel

+ (instancetype)sharedModel
{
    static TDTaskModel *sharedModel;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModel = [[self alloc] initPrivate];
    });
    return sharedModel;
}

- (instancetype)initPrivate
{
    if (self = [super init]) {}
    return self;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[TDTaskModel sharedModel]"];
    return nil;
}


- (TDTask *)createTaskNote:(NSString *)note label:(NSString *)label
{
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    
    TDTask *task = [NSEntityDescription insertNewObjectForEntityForName:@"TDTask"
                                                 inManagedObjectContext:appdelegate.managedObjectContext];
    task.note = note;
    task.label = label;
    task.timestamp = [NSDate date];
    task.isComplete = NO;
    
    return nil;
}



@end
   
   
   
   
   
   
   
   
   
   
   
   
   
   
