//
//  AddToDoItemViewController.h
//  ToDoList
//
//  Created by Connor Egbert on 1/24/15.
//  Copyright (c) 2015 Connor Egbert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface AddToDoItemViewController : UIViewController <UITextFieldDelegate>

@property ToDoItem *toDoItem;

@end
