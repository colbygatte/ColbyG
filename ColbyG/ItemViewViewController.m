//
//  ItemViewViewController.m
//  ColbyG
//
//  Created by Colby Gatte on 10/13/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

#import "ItemViewViewController.h"

@interface ItemViewViewController ()

@end

@implementation ItemViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
    // Do any additional setup after loading the view.
    
    self.itemName.text = self.selectedItem.itemName;
    self.itemQuantity.text = self.selectedItem.itemQuantity;
    self.itemDescription.text = @"";
    
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
