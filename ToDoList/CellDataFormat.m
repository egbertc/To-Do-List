//
//  CellDataFormat.m
//  ToDoList
//
//  Created by Connor Egbert on 1/25/15.
//  Copyright (c) 2015 Connor Egbert. All rights reserved.
//

#import "CellDataFormat.h"

@implementation CellDataFormat

+ (NSString*) getDeadlineStringForItem:(ToDoItem *)item
{
    NSString *deadlineString;
    if (item.completed)
    {
        deadlineString = @"complete.";
        return deadlineString;
    }
    else if (item.deadline == nil) // check for no deadline situtation
    {
        deadlineString = @"no deadline.";
        return deadlineString;
    }
    
    NSUInteger flags = NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:[NSDate date] toDate:item.deadline options:0]; // convert the deadline timestamp into useable count of months, days, hours, minutes and seconds
    
    
    /*
     this following massive if statements covers most combinations of singular and plural units
     only prints the 2 largest units because no one needs to know the exact second of a deadline that is 3 months into the future.
     as the date approaches it gradually becomes more precise until it's just minutes and seconds.
     
     also accounts for past due. it negates all the values so that the units turn positive.
     */
    
    if ([components month] > 0)
    {
        if([components month] == 1 && [components day] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: 1 month, %ld days", [components day]];
        else if([components month] == 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld month", [components month]];
        else if([components day] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld months, %ld days", [components month], [components day]];
        else
            deadlineString = [NSString stringWithFormat:@"deadline: %ld months", [components month]];
    }
    else if ([components day] > 0)
    {
        if([components day] == 1 && [components hour] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: 1 day, %ld hours", [components hour]];
        else if([components day] == 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld day", [components day]];
        else if([components hour] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld days, %ld hours", [components day], [components hour]];
        else
            deadlineString = [NSString stringWithFormat:@"deadline: %ld days", [components day]];
    }
    else if ([components hour] > 0)
    {
        if([components hour] == 1 && [components minute] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: 1 hour, %ld minutes", [components minute]];
        else if([components hour] == 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld hour", [components hour]];
        else if([components minute] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld hours, %ld minutes", [components hour], [components minute]];
        else
            deadlineString = [NSString stringWithFormat:@"deadline: %ld hours", [components hour]];
    }
    else if ([components minute] > 0)
    {
        if([components minute] == 1 && [components second] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: 1 minute, %ld seconds", [components minute]];
        else if([components minute] == 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld minute", [components minute]];
        else if([components second] > 1)
            deadlineString =[NSString stringWithFormat:@"deadline: %ld minutes, %ld seconds", [components minute], [components second]];
        else
            deadlineString = [NSString stringWithFormat:@"deadline: %ld minutes", [components minute]];
    }
    else if ([components second] > 0)
    {
        if([components second] == 1)
            deadlineString = [NSString stringWithFormat:@"deadline: %ld second", [components second]];
        else
            deadlineString = [NSString stringWithFormat:@"deadline: %ld seconds", [components second]];
    }
    else if ([components month] < 0)
    {
        if([components month] == -1 && [components day] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: 1 month, %ld days", -[components day]];
        else if([components month] == -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld month", -[components month]];
        else if([components day] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld months, %ld days", -[components month], [components day]];
        else
            deadlineString = [NSString stringWithFormat:@"OVERDUE: %ld months", -[components month]];
    }
    else if ([components day] < 0)
    {
        if([components day] == -1 && [components hour] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: 1 day, %ld hours", -[components hour]];
        else if([components day] == -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld day", -[components day]];
        else if([components hour] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld days, %ld hours", -[components day], -[components hour]];
        else
            deadlineString = [NSString stringWithFormat:@"OVERDUE: %ld days", -[components day]];
    }
    else if ([components hour] < 0)
    {
        if([components hour] == -1 && [components minute] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: 1 hour, %ld minutes", -[components minute]];
        else if([components hour] == -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld hour", -[components hour]];
        else if([components minute] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld hours, %ld minutes", -[components hour], -[components minute]];
        else
            deadlineString = [NSString stringWithFormat:@"OVERDUE: %ld hours", -[components hour]];
    }
    else if ([components minute] < 0)
    {
        if([components minute] == -1 && [components second] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: 1 minute, %ld seconds", -[components minute]];
        else if([components minute] == -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld minute", -[components minute]];
        else if([components second] < -1)
            deadlineString =[NSString stringWithFormat:@"OVERDUE: %ld minutes, %ld seconds", -[components minute], -[components second]];
        else
            deadlineString = [NSString stringWithFormat:@"OVERDUE: %ld minutes", -[components minute]];
    }
    else if ([components second] < 0)
    {
        if([components second] == -1)
            deadlineString = [NSString stringWithFormat:@"OVERDUE: %ld second", -[components second]];
        else
            deadlineString = [NSString stringWithFormat:@"OVERDUE: %ld seconds", -[components second]];
    }
    
    return deadlineString; // returns the custom string
}

+ (UIColor*) getBGColorForItem:(ToDoItem *)item
{
    UIColor *cellBG;
    
    double secondsToDeadline = [item.deadline timeIntervalSinceNow]; // how many seconds until deadline
    
    if(item.completed)
    {
        cellBG = [UIColor colorWithRed:113.0/255.0 green:217.0/255.0 blue:161.0/255.0 alpha:1.0]; // light greenish
    }
    else if (item.deadline == nil) // no deadline set
    {
        return [UIColor colorWithRed:59/255.0 green:151/255.0 blue:196/255.0 alpha:1.0]; // blueish (same as nav bar)
    }
    else if(secondsToDeadline <= 0.0) // past due
    {
        cellBG = [UIColor colorWithRed:237.0/255.0 green:128.0/255.0 blue:148.0/255.0 alpha:1.0]; // light redish
    }
    else // just a normal cell
    {
        cellBG = [UIColor whiteColor]; // white
    }
    
    return cellBG;
}

@end
