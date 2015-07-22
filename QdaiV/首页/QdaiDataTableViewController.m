//
//  QdaiDataTableViewController.m
//  QdaiV
//
//  Created by 口贷网 on 15/7/21.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "QdaiDataTableViewController.h"
#import "QdaiDataModel.h"

@interface QdaiDataTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *backOrderSumLabel;// 累计已还订单总额
@property (weak, nonatomic) IBOutlet UILabel *waitOrderSumLabel;// 累计待收订单总额
@property (weak, nonatomic) IBOutlet UILabel *totalGetInterestLabel;// 累计成功付息总额
@property (weak, nonatomic) IBOutlet UILabel *nowWaitGetInterestLabel;// 当前待收利息总额
@property (weak, nonatomic) IBOutlet UILabel *thisMothOrderSumLabel;// 本月合计订单总额
@property (weak, nonatomic) IBOutlet UILabel *preMonthOrederSumLabel;// 上月合计订单总额
@property (weak, nonatomic) IBOutlet UILabel *thisQuerterOrderSumLabel;// 当季合计订单总额
@property (weak, nonatomic) IBOutlet UILabel *preQuarterOrderSumLabel;// 前季合计订单总额
@property (weak, nonatomic) IBOutlet UILabel *thisYearOrderSumLabel;// 今年合计订单总额
@property (weak, nonatomic) IBOutlet UILabel *preYearOrderSumLabel;// 去年合计订单总额
@property (weak, nonatomic) IBOutlet UILabel *nowingOrderSumLabel;// 正在进行订单总数
@property (weak, nonatomic) IBOutlet UILabel *nowingOrderCountSumLabel;// 正在进行标段总数

@property (weak, nonatomic) IBOutlet UILabel *lateBackMoneySumLabel;// 逾期还款累计总额
@property (weak, nonatomic) IBOutlet UILabel *lateBackCountSumLabel;// 逾期数
@property (weak, nonatomic) IBOutlet UILabel *lateBackPercentLabel;// 逾期率
@property (weak, nonatomic) IBOutlet UILabel *guaranteeMoneyLabel;// 抵押物已变现总额
@property (weak, nonatomic) IBOutlet UILabel *badMoneyPercentLabel;// 坏账率
@property (weak, nonatomic) IBOutlet UILabel *badMoneyLabel;// 坏账额

@end

@implementation QdaiDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getQdaiData];
}

- (void)getQdaiData {
    [NetManager GETDataWithParams:nil withUrl:@"PublishData/GetData" success:^(id object) {
        QdaiDataModel *model = [QdaiDataModel objectWithKeyValues:object];
        if ([model.statusCode isEqualToString:@"1"]) {
            _backOrderSumLabel.text = NUMBER_WITH_YUAN(model.contentStr.CollectAmount);
            _waitOrderSumLabel.text = NUMBER_WITH_YUAN(model.contentStr.NoCollectAmount);
            _totalGetInterestLabel.text = NUMBER_WITH_YUAN(model.contentStr.InterestAmount);
            _nowWaitGetInterestLabel.text = NUMBER_WITH_YUAN(model.contentStr.NoInterestAmount);
            
            _preMonthOrederSumLabel.text = (model.contentStr.UpMonthAmount);
            _thisMothOrderSumLabel.text = (model.contentStr.ThisMonthAmount);
            _thisQuerterOrderSumLabel.text = (model.contentStr.ThisMonthPart);
            _preQuarterOrderSumLabel.text = (model.contentStr.UpMonthPart);
            _thisYearOrderSumLabel.text = (model.contentStr.ThisYear);
            _preYearOrderSumLabel.text = (model.contentStr.UpYear);
            _nowingOrderSumLabel.text = NUMBER_WITH_VALUE(model.contentStr.CartIngCount, @"笔");
            _nowingOrderCountSumLabel.text = NUMBER_WITH_VALUE(model.contentStr.ProIngCount, @"笔");
            
            _lateBackMoneySumLabel.text = model.contentStr.LateCollectAmount;
            _lateBackCountSumLabel.text = NUMBER_WITH_VALUE(model.contentStr.LateCollectCount, @"笔");
            _lateBackPercentLabel.text = model.contentStr.LateTheRates;
            _guaranteeMoneyLabel.text = model.contentStr.EnsureAmount;
            _badMoneyLabel.text = model.contentStr.BadAmount;
            _badMoneyPercentLabel.text = model.contentStr.BadRates;
        } else {
            NSLog(@"12312312312312");
        }
        
    } withAnimation:YES];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = QDAI_THEME_COLOR;
    if (indexPath.row != 0 && indexPath.row != 12) {
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
            [cell setPreservesSuperviewLayoutMargins:NO];
        }
    } else {
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsMake(0, APP_WIDTH, 0, 0)];
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsMake(0, APP_WIDTH, 0, 0)];
        }
        if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
            [cell setPreservesSuperviewLayoutMargins:YES];
        }

    }
    
}

@end
