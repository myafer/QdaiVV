//
//  HomePageTableViewController.m
//  QdaiV
//
//  Created by 口贷网 on 15/7/20.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "SDCycleScrollView.h"
#import "QdaiHomePageModel.h"

#import "LoginViewController.h"

@interface HomePageTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *investAllLabel;
@property (weak, nonatomic) IBOutlet UILabel *gainAllLabel;

@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = APP_BACK_COLOR;
    [self getDataRequest];
    NSArray *imageArray = @[[UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"1.jpg"]];
    
    SDCycleScrollView *imageCycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, APP_WIDTH, 105 * APP_SCALE)  imagesGroup:imageArray];
    imageCycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    [_topView addSubview:imageCycleView];
    
    LoginViewController *l = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:l animated:YES];
}


#pragma ############ 获取口贷数据请求

- (void)getDataRequest {
    [NetManager GETDataWithParams:nil withUrl:@"index/indexdata" success:^(id object) {
        QdaiHomePageModel *model = [QdaiHomePageModel objectWithKeyValues:object];
        _investAllLabel.text = model.contentStr.InvestAll;
        _gainAllLabel.text = model.contentStr.GainAll;
        
    } failure:^{
        
    } withAnimation:YES];
}

#pragma ############ 获取轮播图片请求
- (void)getImageRequest {
    [NetManager GETDataWithParams:nil withUrl:@"" success:^(id object) {
        
    } failure:^{
        
    } withAnimation:YES];
}

#pragma ########### tableView 的代理方法

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

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
//}

@end
