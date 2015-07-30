//
//  SelectBidHallViewController.m
//  QdaiV
//
//  Created by 口贷网 on 15/7/22.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "SelectBidHallViewController.h"
#import "SliderButtonView.h"
#import "SliderScrollView.h"
#import "TableView.h"

@interface SelectBidHallViewController ()

@end

@implementation SelectBidHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SliderButtonView *sli = [[SliderButtonView alloc] initWithFrame:CGRectMake(0, 0,APP_WIDTH, 44) withButtonNames:@[@"正在招标", @"最新满标", @"成功还标"]];
    [self.view addSubview:sli];
    
    
    TableView *view1 = [[TableView alloc] initWithFrame:CGRectMake(0, 44, APP_WIDTH, APP_HEIGHT - 152)];
    view1.backgroundColor = [UIColor redColor];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 44 , APP_WIDTH, APP_HEIGHT - 152)];
    view2.backgroundColor = [UIColor blueColor];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 44, APP_WIDTH, APP_HEIGHT - 152)];
    view3.backgroundColor = [UIColor purpleColor];
    NSArray *viewArray = @[view1, view2, view3];
    
    SliderScrollView *slis = [[SliderScrollView alloc] initWithFrame:CGRectMake(0, 44, APP_WIDTH, APP_HEIGHT - 152) withViewArray:viewArray];
    [self.view addSubview:slis];
    
    slis.get_Index_Block = ^(NSInteger index){
        sli.index = index;
    };
    sli.button_selected_block = ^(NSInteger tag) {
        slis.scr.contentOffset = CGPointMake(tag * APP_WIDTH, 0);
    };

}


@end
