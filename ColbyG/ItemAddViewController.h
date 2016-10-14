//
//  ItemAddViewController.h
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

//#import "ViewController.h"
#import <UIKit/UIKit.h>

#import "HexToRGB.h"
#import "Values.h"
#import "Store.h"
#import "Item.h"

@protocol ItemAddViewController_Delegate
// We don't have to pass anything here, because we are adding an item
// to an existing store. We are passing around the same object,
// so we just need to invoke this method to tell whoever needs telling
// that something in the "stores" array has changed, and that we need to write
// the changes
- (void) storeDataHasChanged;
@end

@interface ItemAddViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *itemNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *itemQuantityTextField;
@property (nonatomic, strong) Store *selectedStore;
@property (nonatomic, assign) id<ItemAddViewController_Delegate> delegate;

@end
