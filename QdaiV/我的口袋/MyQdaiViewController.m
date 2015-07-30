//
//  MyQdaiViewController.m
//  QdaiV
//
//  Created by 口贷网 on 15/7/22.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "MyQdaiViewController.h"

@interface MyQdaiViewController ()

@end

@implementation MyQdaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = APP_BACK_COLOR;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.000001;
}



@end
