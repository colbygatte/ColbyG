//
//  ItemViewViewController.h
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "HexToRGB.h"
#import "Values.h"

@interface ItemViewViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *itemName;
@property (nonatomic, weak) IBOutlet UILabel *itemQuantity;
@property (nonatomic, weak) IBOutlet UILabel *itemDescription;

@property (nonatomic, strong) Item *selectedItem;

@end
