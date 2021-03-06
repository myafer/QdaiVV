//
//  SliderScrollView.h
//  ScrButton
//
//  Created by 口贷网 on 15/7/8.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Get_Index)(NSInteger index);

@interface SliderScrollView : UIView <UIScrollViewDelegate> {
    NSInteger _currentIndex;
}

@property (nonatomic, strong) UIScrollView *scr;
@property (nonatomic, copy) Get_Index get_Index_Block;
@property (nonatomic, assign) NSInteger currentIndex;

- (instancetype)initWithFrame:(CGRect)frame withViewArray:(NSArray *)viewArray;

@end
