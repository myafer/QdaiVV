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

/**
 *  GET 请求
 *
 *  @param params        拼接字典
 *  @param url           子Url
 *  @param success       成功回调 Blcok
 *  @param failure       失败回调 Blcok
 *  @param animationFlag 动画参数 YES 为开启动画 NO 为不开启动画
 */
+ (void)GETDataWithParams:(NSMutableDictionary *)params
                  withUrl:(NSString *)url
                  success:(void (^)(id object))success
                  failure:(dispatch_block_t)failure
            withAnimation:(BOOL)animationFlag;

/**
 *  POST 请求
 *
 *  @param params        拼接字典
 *  @param url           子Url
 *  @param success       成功回调 Blcok
 *  @param failure       失败回调 Blcok
 *  @param animationFlag 动画参数 YES 为开启动画 NO 为不开启动画
 */
+ (void)POSTDataWithParams:(NSMutableDictionary *)params
                   withUrl:(NSString *)url
                   success:(void (^)(id object))success
                   failure:(dispatch_block_t)failure
             withAnimation:(BOOL)animationFlag;

@end
