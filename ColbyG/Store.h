//
//  Store.h
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Store : NSObject

@property (nonatomic, copy)     NSString        *storeName;
@property (nonatomic, copy)     NSString        *storeID;
@property (nonatomic, strong)   NSMutableArray  *storeItems;


- (void) moveItemFrom:(int)itemIndex1 to:(int)itemIndex2;

@end
