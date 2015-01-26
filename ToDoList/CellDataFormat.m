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
    else if (item.deadline == nil)
    {
        deadlineString = @"no deadline.";
        return deadlineString;
    }
    
    NSUInteger flags = NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:[NSDate date] toDate:item.deadline options:0];
    
    
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
        
        //deadlineString = [NSString stringWithFormat:@"deadline: %ld days, %ld hours, and %ld minutes", [components day], [components hour], [components minute]];
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
    
    return deadlineString;
}

+ (UIColor*) getBGColorForItem:(ToDoItem *)item
{
    UIColor *cellBG;
    
    
    double secondsToDeadline = [item.deadline timeIntervalSinceNow];
    
    if(item.completed)
    {
        cellBG = [UIColor colorWithRed:113.0/255.0 green:217.0/255.0 blue:161.0/255.0 alpha:1.0];
    }
    else if (item.deadline == nil)
    {
        //cellBG = ;
        return [UIColor colorWithRed:59/255.0 green:151/255.0 blue:196/255.0 alpha:1.0];
    }
    else if(secondsToDeadline <= 0.0)
    {
        cellBG = [UIColor colorWithRed:237.0/255.0 green:128.0/255.0 blue:148.0/255.0 alpha:1.0];//UIColor *cellBG = [UIColor redColor];
    }
    else
    {
        cellBG = [UIColor whiteColor];
    }
    
    return cellBG;
}

@end
