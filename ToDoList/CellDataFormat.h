//
//  CellDataFormat.h
//  ToDoList
//
//  Created by Connor Egbert on 1/25/15.
//  Copyright (c) 2015 Connor Egbert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface CellDataFormat : NSObject

+ (NSString*) getDeadlineStringForItem:(ToDoItem*)item;
+ (UIColor*) getBGColorForItem:(ToDoItem*)item;

@end
