//
//  Stores.h
//  ColbyG
//
//  Created by Colby Gatte on 10/14/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Store.h"
#import "Item.h"

@interface Stores : NSMutableArray
- (void) moveStoreFrom:(int)storeIndex1 to:(int)storeIndex2;
@end
