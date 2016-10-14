//
//  StoreListTableViewController.m
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "StoreListTableViewController.h"

@interface StoreListTableViewController ()

@end

@implementation StoreListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment this line to erase all data
    //[self deleteStoreData];
    
    // DON'T FORGET
    // Initialize "stores"
    stores = [[NSMutableArray alloc] init];
    // Load the data AFTER initialization!
    [self loadStoreData];
    
    //
    // Table styling
    self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // HIDE the cell sepearator
    
    // This doesn't do anything:
    //self.navigationController.editButtonItem.tintColor = [UIColor whiteColor];
    //
    //
    
}


/******************************************************************
 * Handle store data
 ******************************************************************/
// Save all data in "stores"
- (void) saveStoreData {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:stores];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:encodedObject forKey:@"storeData"];
    [defaults synchronize];
}

// Load data from NSUserDefaults key "storeData" into "stores"
- (void) loadStoreData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"storeData"];
    
    NSMutableArray *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    stores = object;
    if(stores == nil) {
        stores = [[NSMutableArray alloc] init];
    }
}

- (void) deleteStoreData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"storeData"];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/******************************************************************
 * Segue
 ******************************************************************/
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"StoreAdd"]) {
        StoreAddViewController *storeAddViewController = segue.destinationViewController;
        storeAddViewController.delegate = self;
    } else if([segue.identifier isEqualToString:@"ViewStoreFromCell"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        StoreViewItemsTableViewController *s = segue.destinationViewController;
        s.delegate = self;
        Store *store = stores[indexPath.row];
        s.items = store.storeItems;
        s.selectedStore = store;
    }
}

/******************************************************************
 * Delegates methods
 ******************************************************************/
- (void) storeAddViewController_DidAddStore:(Store *)storeToAdd {
    [stores addObject:storeToAdd];
    [self storeDataHasChanged];
}

- (void) storeDataHasChanged {
    [self saveStoreData];
    [self reloadTableData];
}

- (void) reloadTableData {
    [self.tableView reloadData];
}


/******************************************************************
 * tableView
 ******************************************************************/

// numberOfSectionsInTableView
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// numberOfRowsInSection
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return stores.count;
}

// cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Store *viewThisStore = stores[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreCell" forIndexPath:indexPath];
    cell.textLabel.text = viewThisStore.storeName;
    NSString *subtitle;
    if(viewThisStore.storeItems.count > 1) {
        subtitle = [NSString stringWithFormat:@"%d items", viewThisStore.storeItems.count];
    } else if(viewThisStore.storeItems.count <= 0) {
        subtitle = @"no items";
    } else {
        subtitle = @"1 item";
    }
    cell.detailTextLabel.text = subtitle;
    
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



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [stores removeObjectAtIndex:indexPath.row];
        [self saveStoreData];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
