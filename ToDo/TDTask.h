//
//  TDTask.h
//  ToDo
//
//  Created by Anthony Fennell on 3/2/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TDTask : NSManagedObject

@property (nonatomic) BOOL isComplete;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSDate * completionDate;

@end
