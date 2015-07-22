//
//  BaseNavigationViewController.m
//  QdaiV
//
//  Created by 口贷网 on 15/7/20.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
       
        self.navigationBar.translucent = NO;
        [[UINavigationBar appearance] setBackgroundColor:QDAI_THEME_COLOR];
        [[UINavigationBar appearance] setBarTintColor:QDAI_THEME_COLOR];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
