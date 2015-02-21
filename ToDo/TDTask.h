//
//  TDTask.h
//  ToDo
//
//  Created by Anthony Fennell on 2/20/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TDTask : NSManagedObject

@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString * label;
@property (nonatomic) BOOL isComplete;

@end
