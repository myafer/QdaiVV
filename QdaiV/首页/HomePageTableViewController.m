//
//  HomePageTableViewController.m
//  QdaiV
//
//  Created by 口贷网 on 15/7/20.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "SDCycleScrollView.h"

@interface HomePageTableViewController ()

@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = QDAI_BACK_COLOR;
    
    NSArray *imageArray = @[[UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"]];
    
    SDCycleScrollView *imageCycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, APP_WIDTH, 105 * APP_SCALE)  imagesGroup:imageArray];
    imageCycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    [_topView addSubview:imageCycleView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 4) {
        return 0;
    } else {
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 105 * APP_SCALE;
    } else if (indexPath.row == 2) {
        return 65;
    } else if (indexPath.row == 4) {
        return 44;
    } else if (indexPath.row == 6) {
        return 44;
    } else if (indexPath.row == 7) {
        return 80;
    } else if (indexPath.row == 9) {
        return 125 * APP_SCALE;
    }
    if (indexPath.row == 1) {
        
    }
    return 10;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}


@end
