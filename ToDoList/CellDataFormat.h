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
/*!
 @function getDeadLineStringForItem:
 @abstract returns the string in the format of 'deadline: X months, Y days...' with multiple variations depending on timing.
 @param item
    the item that contains the deadline data
 */
+ (NSString*) getDeadlineStringForItem:(ToDoItem*)item;

/*!
 @function getBGColorForItem:
 @abstract returns the background color for the cell depending on time and completion.
 @param item
    the item that contains the timing and completion data
 */
+ (UIColor*) getBGColorForItem:(ToDoItem*)item;

@end
