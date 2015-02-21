//
//  TDTaskModel.h
//  ToDo
//
//  Created by Anthony Fennell on 2/20/15.
//  Copyright (c) 2015 Anthony Fennell. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDTask;

@interface TDTaskModel : NSObject

+ (instancetype)sharedModel;

- (TDTask *)createTaskNote:(NSString *)note label:(NSString *)label;

@end
