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
    isEditing = NO;
    
    //
    // Table styling
    self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
    self.addButton.tintColor = [UIColor colorWithHexString:NAV_BAR_BUTTON_TINTCOLOR];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // HIDE the cell sepearator
    
    self.title = self.selectedStore.storeName;
    
    //
    // Long press for edit
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(longPressGestureRecognized:)];
    [self.tableView addGestureRecognizer:longPress];
    
    //
    // Hide the done editing button
    [self.doneEditingButton setTintColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]];
    
}

- (void) longPressGestureRecognized:(id)sender {
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    UIGestureRecognizerState state = longPress.state;
    
    CGPoint location = [longPress locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    [self.doneEditingButton setTintColor:[UIColor colorWithHexString:NAV_BAR_BUTTON_TINTCOLOR]];
    [self.addButton setTintColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]];
    //self.addButton.title = @"Done";
    isEditing = YES;
    [self.tableView setEditing:YES];
    
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
- (IBAction) dontEditingButtonPressed {
    [self.doneEditingButton setTintColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]];
    [self.addButton setTintColor:[UIColor colorWithHexString:NAV_BAR_BUTTON_TINTCOLOR]];
    [self.tableView setEditing:NO];
}




/******************************************************************
 * Segue
 ******************************************************************/
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ItemAdd"]) {
        ItemAddViewController *itemAddViewController = segue.destinationViewController;
        itemAddViewController.selectedStore = self.selectedStore;
        itemAddViewController.delegate = self;
    } else if([segue.identifier isEqualToString:@"ItemView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ItemViewViewController *itemViewViewController = segue.destinationViewController;
        itemViewViewController.selectedItem = self.selectedStore.storeItems[indexPath.row];
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



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.selectedStore.storeItems removeObjectAtIndex:indexPath.row];
        [self.delegate saveStoreData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    int r1 = fromIndexPath.row;
    int r2 = toIndexPath.row;
    
    [self.selectedStore moveItemFrom:r1 to:r2];
    
    [self.delegate storeDataHasChanged];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    
    return YES;
}



@end
