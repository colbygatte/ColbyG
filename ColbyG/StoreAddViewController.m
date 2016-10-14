//
//  StoreAddViewController.m
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "StoreAddViewController.h"

@interface StoreAddViewController ()

@end

@implementation StoreAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
    
    self.storeNameTextField.layer.borderColor = [[UIColor colorWithHexString:TEXT_FIELD_BG_COLOR] CGColor];
    self.storeNameTextField.layer.borderWidth = 1.0;

    self.storeIDTextField.layer.borderColor = [[UIColor colorWithHexString:TEXT_FIELD_BG_COLOR] CGColor];
    self.storeIDTextField.layer.borderWidth = 1.0;
    
}

/******************************************************************
 * Buttons
 ******************************************************************/
- (IBAction) addButtonPressed {
    
    Store *storeToAdd       = [[Store alloc] init];
    storeToAdd.storeName    = self.storeNameTextField.text;
    storeToAdd.storeID      = self.storeIDTextField.text;
    storeToAdd.storeItems   = [[NSMutableArray alloc] init];
    
    [self.delegate storeAddViewController_DidAddStore:storeToAdd];
    
    [self exitView];
}

- (IBAction) cancelButtonPressed {
    [self exitView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) exitView {
    [self dismissViewControllerAnimated:YES completion:nil];
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
