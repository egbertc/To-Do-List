//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Connor Egbert on 1/24/15.
//  Copyright (c) 2015 Connor Egbert. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"
#import "CellDataFormat.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;
@property NSString *sortMethod;

@end

@implementation ToDoListTableViewController



- (void) loadInitialData
{
    ToDoItem *item0 = [[ToDoItem alloc] init];
    item0.itemName = @"Finish App";
    item0.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)-5000];
    item0.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Graduate";
    item1.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)10000000];
    item1.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Spin up A.I. Cloud Cluster on Google Cloud with leftover Big Data credits";
    item2.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)10086000];
    item2.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Wait for A.I. to solve star travel problems";
    item3.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)13000000];
    item3.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item4 = [[ToDoItem alloc] init];
    item4.itemName = @"Assemble list of materials";
    item4.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)13086000];
    item4.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item5 = [[ToDoItem alloc] init];
    item5.itemName = @"Build drone Army";
    item5.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)16000000];
    item5.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item6 = [[ToDoItem alloc] init];
    item6.itemName = @"Take over off-the-grid island in the Philippines";
    item6.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)16170000];
    item6.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item7 = [[ToDoItem alloc] init];
    item7.itemName = @"Build secret command center and base of operations";
    item7.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)16240000];
    item7.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item8 = [[ToDoItem alloc] init];
    item8.itemName = @"Build large weaponized starship";
    item8.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)20000000];
    item8.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item9 = [[ToDoItem alloc] init];
    item9.itemName = @"Assemble team of scientists, linguists, mechanics, and mercenaries";
    item9.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)20086000];
    item9.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item10 = [[ToDoItem alloc] init];
    item10.itemName = @"Give 1 month's notice to landlord";
    item10.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)20160000];
    item10.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item11 = [[ToDoItem alloc] init];
    item11.itemName = @"Have sweet space-captain uniform custom tailored";
    item11.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)20160000];
    item11.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item12 = [[ToDoItem alloc] init];
    item12.itemName = @"Purchase a couple new go pros.";
    item12.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)20240000];
    item12.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item13 = [[ToDoItem alloc] init];
    item13.itemName = @"Take group shot in front of starship.";
    item13.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)21960000];
    item13.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item14 = [[ToDoItem alloc] init];
    item14.itemName = @"Send pic to Elon Musk";
    item14.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)21960120];
    item14.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item15 = [[ToDoItem alloc] init];
    item15.itemName = @"Cancel Netflix subscription";
    item15.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)22040000];
    item15.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item16 = [[ToDoItem alloc] init];
    item16.itemName = @"Depart Earth";
    item16.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)22126000];
    item16.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item17 = [[ToDoItem alloc] init];
    item17.itemName = @"Depart Solar System";
    item17.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)22128000];
    item17.priority = [NSNumber numberWithInt:3];
    
    ToDoItem *item18 = [[ToDoItem alloc] init];
    item18.itemName = @"Conquer Galaxy";
    item18.deadline = [NSDate dateWithTimeIntervalSinceNow:(NSTimeInterval)99000000];
    item18.priority = [NSNumber numberWithInt:3];
    
    [self.toDoItems addObject:item0];
    [self.toDoItems addObject:item1];
    [self.toDoItems addObject:item2];
    [self.toDoItems addObject:item3];
    [self.toDoItems addObject:item4];
    [self.toDoItems addObject:item5];
    [self.toDoItems addObject:item6];
    [self.toDoItems addObject:item7];
    [self.toDoItems addObject:item8];
    [self.toDoItems addObject:item9];
    [self.toDoItems addObject:item10];
    [self.toDoItems addObject:item11];
    [self.toDoItems addObject:item12];
    [self.toDoItems addObject:item13];
    [self.toDoItems addObject:item14];
    [self.toDoItems addObject:item15];
    [self.toDoItems addObject:item16];
    [self.toDoItems addObject:item17];
    [self.toDoItems addObject:item18];
    
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddToDoItemViewController *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    
    if (item != nil)
    {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];

        if([_sortMethod  isEqual: @"deadline"])
            [self sortList:_deadlineSortButton];
        else
            [self sortList:_creationSortButton];    }
}

- (IBAction)sortList:(id)sender
{
    NSArray *unsortedList = [self.toDoItems copy];
    NSArray *sortedList;
    
    if ([sender isEqual:_deadlineSortButton])
    {
      //  NSLog(@"SORT BY DEADLINE");
        _sortMethod = @"deadline";
        sortedList = [self.toDoItems sortedArrayUsingComparator:^NSComparisonResult(ToDoItem *itemA, ToDoItem *itemB) {
            return [itemA.deadline compare:itemB.deadline];
        }];
        
    }
    else
    {
      //  NSLog(@"SORT BY CREATION");
        _sortMethod = @"creation";
        sortedList = [self.toDoItems sortedArrayUsingComparator:^NSComparisonResult(ToDoItem *itemA, ToDoItem *itemB) {
            return [itemA.creationDate compare:itemB.creationDate];
        }];
        
    }
    self.toDoItems = [sortedList mutableCopy];
    //[self.tableView reloadData];
    
    
    /*
     found cool animated sort example.
     source: http://blog.neuwert-media.com/2013/05/animated-sorting-in-uitableview/
     */
    
    
    [self.tableView beginUpdates];
    
    NSInteger sourceRow = 0;
    for (NSString *item in unsortedList)
    {
        NSInteger destRow = [self.toDoItems indexOfObject:item];
        
        if (destRow != sourceRow) {
            // Move the rows within the table view
            NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForItem:sourceRow inSection:0];
            NSIndexPath *destIndexPath = [NSIndexPath indexPathForItem:destRow inSection:0];
            [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destIndexPath];
            
        }
        sourceRow++;
    }
    
    // Commit animations
    [self.tableView endUpdates];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _sortMethod = @"deadline";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.toDoItems = [[NSMutableArray alloc] init];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1.0]];
    [self loadInitialData];
    [self sortList:_deadlineSortButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    
    cell.detailTextLabel.text = [CellDataFormat getDeadlineStringForItem:toDoItem];
    
    
    [cell setBackgroundColor:[CellDataFormat getBGColorForItem:toDoItem]];
    
    
    if (toDoItem.completed)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        [cell.textLabel setTextColor:[UIColor whiteColor]];
        [cell.detailTextLabel setTextColor:[UIColor whiteColor]];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        if(cell.backgroundColor == [UIColor whiteColor])
        {
            [cell.textLabel setTextColor:[UIColor blackColor]];
            [cell.detailTextLabel setTextColor:[UIColor blackColor]];
        }
        else
        {
            [cell.textLabel setTextColor:[UIColor whiteColor]];
            [cell.detailTextLabel setTextColor:[UIColor whiteColor]];
        }
        
    }
    
    return cell;
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
