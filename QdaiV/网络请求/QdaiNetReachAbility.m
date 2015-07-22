//
//  QdaiNetReachAbility.m
//  Qdai
//
//  Created by 口贷网 on 15/3/16.
//  Copyright (c) 2015年 qdai. All rights reserved.
//

#import "QdaiNetReachAbility.h"
#import "AFNetworking.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import <SystemConfiguration/SCNetwork.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>

@implementation QdaiNetReachAbility

+ (BOOL)netReachAbility {
    
    struct sockaddr_in initAddress;                             //sockaddr_in是与sockaddr等价的数据结构
    bzero(&initAddress, sizeof(initAddress));
    initAddress.sin_len = sizeof(initAddress);
    initAddress.sin_family = AF_INET;                      //sin_family是地址家族，一般都是“AF_xxx”的形式。通常大多用的是都是AF_INET,代表TCP/IP协议族
    
    SCNetworkReachabilityRef     readRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&initAddress);     //创建测试连接的引用：
    SCNetworkReachabilityFlags flags;
    
    BOOL getRetrieveFlags = SCNetworkReachabilityGetFlags(readRouteReachability, &flags);
    CFRelease(readRouteReachability);
    
    if (!getRetrieveFlags) {
        return NO;
    }
    
    BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (flagsReachable && !connectionRequired) ? YES : NO;
    
//    NSLog(@"%@", [[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString]);
//    if ([[[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString] isEqualToString:@"Unknown"]) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            // 只执行1次的代码(这里面默认是线程安全的)
//            [QdaiAlert myAlertShowWithString:@"您的网络连接可能存在问题，请检查您的手机网络，如果网络未连接将会影响您的使用！谢谢！"];
//        });
//        return NO;
//    } else {
//        return YES;
//    }
}

@end
