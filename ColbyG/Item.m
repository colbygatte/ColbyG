//
//  Item.m
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id) initWithCoder: (NSCoder *) decoder {
    if(self = [super init]) {
        self.itemName           = [decoder decodeObjectForKey: @"itemName"];
        self.itemQuantity       = [decoder decodeObjectForKey: @"itemQuantity"];
        self.itemDescription    = [decoder decodeObjectForKey: @"itemDescription"];
        self.itemChecked        = [decoder decodeObjectForKey: @"itemChecked"];
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *) encoder {
    [encoder encodeObject: self.itemName        forKey: @"itemName"];
    [encoder encodeObject: self.itemQuantity    forKey: @"itemQuantity"];
    [encoder encodeObject: self.itemDescription forKey: @"itemDescription"];
    [encoder encodeObject: self.itemChecked     forKey: @"itemChecked"];
}



@end
