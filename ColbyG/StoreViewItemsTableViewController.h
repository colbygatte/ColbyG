//
//  StoreViewItemsTableViewController.h
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Values.h"
#import "HexToRGB.h"
#import "Item.h"
#import "Store.h"
#import "ItemAddViewController.h"
#import "ItemViewViewController.h"

@protocol StoreViewItemsTableViewController_Delegate
- (void) storeDataHasChanged;
- (void) saveStoreData;
@end


@interface StoreViewItemsTableViewController : UITableViewController <ItemAddViewController_Delegate>

@property (nonatomic, strong) Store *selectedStore;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) id<StoreViewItemsTableViewController_Delegate> delegate;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;

@end
