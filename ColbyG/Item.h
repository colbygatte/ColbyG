//
//  Item.h
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

//
//NSPredicate

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemQuantity;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, assign) NSString *itemChecked;


@end
