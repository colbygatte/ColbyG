//
//  StoreListTableViewController.h
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StoreAddViewController.h"
#import "StoreViewItemsTableViewController.h"
#import "HexToRGB.h"
#import "Values.h"

@interface StoreListTableViewController : UITableViewController <
StoreAddViewController_Delegate, StoreViewItemsTableViewController_Delegate
>
{
    NSMutableArray *stores;
}

@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;

@end
