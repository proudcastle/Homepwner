//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Markus Stolzenburg on 14.11.12.
//  Copyright (c) 2012 Markus Stolzenburg. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

- (id)init
{
    // Call the superclass´s designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    expenisveItems = [[NSMutableArray alloc] init];
    cheapItems = [[NSMutableArray alloc] init];
    sections = [[NSArray alloc] initWithObjects:@"$50 and more", @"Trash", nil];
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sections count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sections objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [[[BNRItemStore sharedStore] allItems] count];
    
    NSMutableArray *itemForSection = [[NSMutableArray alloc] init];
    if (section == 0) {
        for (BNRItem* b in [[BNRItemStore sharedStore] allItems]) {
            if (b.valueInDollars >= 50) {
                [itemForSection addObject:b];
                [expenisveItems addObject:b];
            }
        }
    }
    if (section == 1) {
        for (BNRItem* b in [[BNRItemStore sharedStore] allItems]) {
            if (b.valueInDollars < 50) {
                [itemForSection addObject:b];
                [cheapItems addObject:b];
            }
        }
    }
    return [itemForSection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:@"UITableViewCell"];
    }
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the TableView
    if (indexPath.section == 0) {
        BNRItem *p = [expenisveItems objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    } else if (indexPath.section == 1) {
        BNRItem *p = [cheapItems objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    }
    
    
    return cell;
}

@end
