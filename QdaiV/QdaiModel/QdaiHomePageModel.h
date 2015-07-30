//
//  QdaiHomePageModel.h
//  QdaiV
//
//  Created by 口贷网 on 15/7/22.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomePageContentstr;
@interface QdaiHomePageModel : NSObject

@property (nonatomic, copy) NSString *statusMessage;

@property (nonatomic, copy) NSString *statusCode;

@property (nonatomic, strong) HomePageContentstr *contentStr;

@end

@interface HomePageContentstr : NSObject

@property (nonatomic, copy) NSString *InvestAll;

@property (nonatomic, copy) NSString *GainAll;

@end
