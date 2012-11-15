//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Markus Stolzenburg on 14.11.12.
//  Copyright (c) 2012 Markus Stolzenburg. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
}

// Notice that this is a class method and prefixed with a + instead of a -
+ (BNRItemStore *)sharedStore;

- (NSArray *)allItems;
- (BNRItem *)createItem;

@end
