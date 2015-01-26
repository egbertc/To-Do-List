//
//  AddToDoItemViewController.m
//  ToDoList
//
//  Created by Connor Egbert on 1/24/15.
//  Copyright (c) 2015 Connor Egbert. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateSelector;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField // hide keyboard when user hits done
{
    if (theTextField == self.textField)
    {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.dateSelector setMinimumDate:[NSDate date]]; // set min date to current
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender != self.saveButton) // if user hits cancel
    {
        return; // carry on with no data stored
    }
    else // user hits save
    {
        NSString *newItemText = [self.textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//remove all blank space to make sure user didn't just enter spaces.
        if (newItemText.length > 0) // if user actually typed something
        {
            self.toDoItem = [[ToDoItem alloc] init]; // create new ToDoItem
            self.toDoItem.itemName = self.textField.text; // set text to user input
            self.toDoItem.completed = NO; // initialize as an incomplete task
            if ([self.dateSelector.date compare:[NSDate date]] == NSOrderedDescending) // check that deadline is past current date.
                self.toDoItem.deadline = self.dateSelector.date; // set deadline
            else
                NSLog(@"time travel not yet possible: no deadline set."); // only happens if the current minute is used
            // if date isn't in future, deadline remains nil
        }
    }
    
}


@end
