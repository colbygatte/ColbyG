//
//  ItemAddViewController.m
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "ItemAddViewController.h"

@interface ItemAddViewController ()

@end

@implementation ItemAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
    
    self.itemNameTextField.layer.borderColor = [[UIColor colorWithHexString:TEXT_FIELD_BG_COLOR] CGColor];
    self.itemNameTextField.layer.borderWidth = 1.0;
    
    self.itemQuantityTextField.layer.borderColor = [[UIColor colorWithHexString:TEXT_FIELD_BG_COLOR] CGColor];
    self.itemQuantityTextField.layer.borderWidth = 1.0;
    
}

- (IBAction) addButtonPressed {
    Item *newItem = [[Item alloc] init];
    newItem.itemName = self.itemNameTextField.text;
    newItem.itemQuantity = self.itemQuantityTextField.text;
    newItem.itemChecked = @"no";
    newItem.itemDescription = @"";
    
    
    [self.selectedStore.storeItems addObject:newItem];
    [self.delegate storeDataHasChanged];
    [self exitView];
}

- (IBAction) cancelButtonPressed {
    [self exitView];
}

- (void) exitView {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
