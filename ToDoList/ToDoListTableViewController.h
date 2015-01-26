//
//  ToDoListTableViewController.h
//  ToDoList
//
//  Created by Connor Egbert on 1/24/15.
//  Copyright (c) 2015 Connor Egbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableViewController : UITableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
- (IBAction)sortList:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *creationSortButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *deadlineSortButton;

@end
