//
//  StoreAddViewController.h
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "Values.h"
#import "HexToRGB.h"

/******************************************************************
 * Protocol
 ******************************************************************/
@protocol StoreAddViewController_Delegate
// Here, we are passing back a store because it is a BRAND NEW STORE,
// there is not a store already in the "stores" object for this store
- (void) storeAddViewController_DidAddStore:(Store *) storeToAdd;
@end

/******************************************************************
 * Interface
 ******************************************************************/
@interface StoreAddViewController : ViewController
@property (nonatomic, strong) id<StoreAddViewController_Delegate> delegate;

@property (nonatomic, strong) IBOutlet UITextField *storeNameTextField;
@property (nonatomic, strong) IBOutlet UITextField *storeIDTextField;

@end
