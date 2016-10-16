//
//  Store.m
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "Store.h"

@implementation Store



- (id) initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.storeName  = [decoder decodeObjectForKey: @"storeName"];
        self.storeID    = [decoder decodeObjectForKey: @"storeID"];
        self.storeItems = [decoder decodeObjectForKey: @"storeItems"];
    }
    return self;
}


- (void) encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject: self.storeName    forKey: @"storeName"];
    [encoder encodeObject: self.storeID      forKey: @"storeID"];
    [encoder encodeObject: self.storeItems   forKey: @"storeItems"];
}

- (void) moveItemFrom:(int)itemIndex1 to:(int)itemIndex2 {
    Item *item = self.storeItems[itemIndex1];
    [self.storeItems removeObjectAtIndex:itemIndex1];
    [self.storeItems insertObject:item atIndex:itemIndex2];
}


@end
