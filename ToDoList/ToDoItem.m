//
//  ToDoItem.m
//  ToDoList
//
//  Created by Connor Egbert on 1/24/15.
//  Copyright (c) 2015 Connor Egbert. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

- (id)init // customized the constructor to auto fill creation date.
{
    if (self = [super init])
    {
        _creationDate = [NSDate date];
    }
    return self;
}

@end
