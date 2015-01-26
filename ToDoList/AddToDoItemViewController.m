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

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender != self.saveButton)
    {
        return;
    }
    else
    {
        NSString *newItemText = [self.textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//remove all blank space to make sure user didn't just enter spaces.
        if (newItemText.length > 0) {
            self.toDoItem = [[ToDoItem alloc] init];
            self.toDoItem.itemName = self.textField.text;
            self.toDoItem.completed = NO;
            if (self.dateSelector.date > [NSDate date]) // check that deadline is past current date.
                self.toDoItem.deadline = self.dateSelector.date;
        }
    }
    
}


@end
