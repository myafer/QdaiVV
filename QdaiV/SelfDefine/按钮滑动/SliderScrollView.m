//
//  SliderScrollView.m
//  ScrButton
//
//  Created by 口贷网 on 15/7/8.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "SliderScrollView.h"

@implementation SliderScrollView

- (instancetype)initWithFrame:(CGRect)frame withViewArray:(NSArray *)viewArray
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat selfWidth = frame.size.width;
        CGFloat selfHeight = frame.size.height;
        NSInteger count = viewArray.count;
        _scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
        _scr.contentSize = CGSizeMake(selfWidth * count, selfHeight);
        _scr.pagingEnabled = YES;
        _scr.delegate = self;
        _scr.showsVerticalScrollIndicator = NO;
        _scr.showsHorizontalScrollIndicator = NO;
        int i = 0;
        for (UIView *view in viewArray) {
            view.frame = CGRectMake(i * selfWidth, 0, selfWidth, selfHeight);
            [_scr addSubview:view];
            i ++;
        }
        [self addSubview:_scr];
        
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(-30, -5, 30, selfHeight + 5)];
        v.backgroundColor = APP_BACK_COLOR ;
        [_scr addSubview:v];
        _scr.backgroundColor = APP_BACK_COLOR;
        _currentIndex = -1;
        
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
    if (_currentIndex != index) {
           _currentIndex = index;
        if (self.get_Index_Block) {
            self.get_Index_Block(index);
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.x < 0) {
//        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
//    }
//    

}



@end
