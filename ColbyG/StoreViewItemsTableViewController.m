//
//  StoreViewItemsTableViewController.m
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "StoreViewItemsTableViewController.h"

@interface StoreViewItemsTableViewController ()

@end

@implementation StoreViewItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    // Table styling
    self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
    self.addButton.tintColor = [UIColor colorWithHexString:NAV_BAR_BUTTON_TINTCOLOR];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // HIDE the cell sepearator
    
    self.title = self.selectedStore.storeName;
    //
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/******************************************************************
 * Delegates
 ******************************************************************/
- (void) storeDataHasChanged {
    [self.tableView reloadData];
    [self.delegate storeDataHasChanged];
}


/******************************************************************
 * Buttons
 ******************************************************************/


/******************************************************************
 * Segue
 ******************************************************************/
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ItemAdd"]) {
        ItemAddViewController *itemAddViewController = segue.destinationViewController;
        itemAddViewController.selectedStore = self.selectedStore;
        itemAddViewController.delegate = self;
    }
}


/******************************************************************
 * tableView
 ******************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Item *item = self.items[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
    cell.textLabel.text = item.itemName;
    UIView *bgView = [[UIView alloc] init];
    if(indexPath.row % 2) {
        cell.backgroundColor = [UIColor colorWithHexString:CELL_1_COLOR];
        bgView.backgroundColor = [UIColor colorWithHexString:CELL_1_SELECTED_BG_VIEW];
    } else {
        cell.backgroundColor = [UIColor colorWithHexString:CELL_2_COLOR];
        bgView.backgroundColor = [UIColor colorWithHexString:CELL_2_SELECTED_BG_VIEW];
    }
    [cell setSelectedBackgroundView:bgView];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
