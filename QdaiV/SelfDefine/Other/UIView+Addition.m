//
//  UIView+Addition.m
//  Qdai
//
//  Created by qdai on 14-4-3.
//  Copyright (c) 2014年 qdai. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)
- (UIViewController *)viewController
{
   UIResponder *next = [self nextResponder];
    do {

        if ([next isKindOfClass:[UIViewController class]]) {
                  
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}




- (UIViewController *) firstViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id) traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}

@end
