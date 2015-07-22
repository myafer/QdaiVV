//
//  QdaiDataModel.h
//  QdaiV
//
//  Created by 口贷网 on 15/7/21.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class contentStr;
@interface QdaiDataModel : NSObject

@property (nonatomic, copy) NSString *statusMessage;

@property (nonatomic, copy) NSString *statusCode;

@property (nonatomic, strong) contentStr *contentStr;

@end

@interface contentStr : NSObject

@property (nonatomic, copy) NSString *UpMonthPart;

@property (nonatomic, copy) NSString *NoInterestAmount;

@property (nonatomic, copy) NSString *LateCollectCount;

@property (nonatomic, copy) NSString *EnsureAmount;

@property (nonatomic, copy) NSString *LendAmount;

@property (nonatomic, copy) NSString *BadRates;

@property (nonatomic, copy) NSString *BadAmount;

@property (nonatomic, copy) NSString *LateTheRates;

@property (nonatomic, copy) NSString *CartIngCount;

@property (nonatomic, copy) NSString *UpYear;

@property (nonatomic, copy) NSString *InterestAmount;

@property (nonatomic, copy) NSString *UpMonthAmount;

@property (nonatomic, copy) NSString *LateCollectAmount;

@property (nonatomic, copy) NSString *CollectAmount;

@property (nonatomic, copy) NSString *ThisMonthPart;

@property (nonatomic, copy) NSString *ThisMonthAmount;

@property (nonatomic, copy) NSString *ThisYear;

@property (nonatomic, copy) NSString *ProIngCount;

@property (nonatomic, copy) NSString *NoCollectAmount;

@end
