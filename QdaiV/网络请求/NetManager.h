//
//  NetManager.h
//  SB
//
//  Created by 口贷网 on 15/4/10.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetManager : NSObject


+ (void)GETDataWithParams:(NSMutableDictionary *)params withUrl:(NSString *)url success:(void (^)(id object))success withAnimation:(BOOL)animationFlag;
+ (void)POSTDataWithParams:(NSMutableDictionary *)params withUrl:(NSString *)url success:(void (^)(id object))success withAnimation:(BOOL)animationFlag;

@end
