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
    if (self = [super init]) {
        // Read in ToDo.xcdatamodeld
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator *psc =
        [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        // Where does the SQLite file go?
        NSString *path = [self itemArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        NSError *error;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            [NSException raise:@"Open Failure"
                        format:@"%@", [error localizedDescription]];
        }
        
        // Create the managed object context
        context = [[NSManagedObjectContext alloc] init];
        context.persistentStoreCoordinator = psc;
    
    }
    return self;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[TDTaskModel sharedModel]"];
    return nil;
}



#pragma mark - Create / Remove

- (TDTask *)createTaskNote:(NSString *)note label:(NSString *)label
{
    TDTask *task = [NSEntityDescription insertNewObjectForEntityForName:@"TDTask"
                                                 inManagedObjectContext:context];
    task.note = note;
    task.label = label;
    task.timestamp = [NSDate date];
    task.isComplete = NO;
    [self saveChanges];
    
    return task;
}

- (void)removeTaskNote:(TDTask *)task
{
    [context deleteObject:task];
    [self saveChanges];
}


#pragma mark - Fetches

- (NSArray *)allTasks
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *e = [NSEntityDescription entityForName:@"TDTask"
                                         inManagedObjectContext:context];
    request.entity = e;
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"completionDate"
                                                                   ascending:YES];
    request.sortDescriptors = @[sortDescriptor];
    NSError *error;
    NSArray *result = [context executeFetchRequest:request
                                             error:&error];
    
    if (!result) {
        [NSException raise:@"Fetch task failed"
                    format:@"Reason: %@", [error localizedDescription]];
    }
    return result;
}


#pragma mark - Save

- (void)saveChanges
{
    NSError *error;
    if(![context save:&error]) {
        NSLog(@"Unresolved error: %@", [error localizedDescription]);
    }
}

#pragma mark - Private Methods

- (NSString *)itemArchivePath {
    // Make sure that the first argument is NSDocumentDirectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}

@end
   
   
   
   
   
   
   
   
   
   
   
   
   
   
