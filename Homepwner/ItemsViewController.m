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
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
        
        self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableBG"]];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 44.0f;
    
    if (indexPath.row < [[[BNRItemStore sharedStore] allItems] count]) {
        rowHeight = 60.0f;
    }
    
    return rowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger i = [[[BNRItemStore sharedStore] allItems] count];
    return i+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:@"UITableViewCell"];
    }
    
    UIFont *bigFont =  [UIFont systemFontOfSize:20.0f];
    
    if (indexPath.row == [[[BNRItemStore sharedStore] allItems] count]) {
        [[cell textLabel] setText:@"No more items"];
        
        return cell;
    }
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the TableView

    BNRItem *p = [[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    [[cell textLabel] setFont:bigFont];
    [[cell textLabel] setText:[p description]];
    
    return cell;
}

@end
