//
//  NetManager.m
//  SB
//
//  Created by 口贷网 on 15/4/10.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "NetManager.h"
#import "QdaiNetReachAbility.h"
#import "MBProgressHUD.h"


@implementation NetManager

+ (void)GETDataWithParams:(NSMutableDictionary *)params withUrl:(NSString *)url success:(void (^)(id object))success failure:(dispatch_block_t)failure withAnimation:(BOOL)animationFlag {
    NSString *comUrl = [NSString stringWithFormat:@"%@%@%@", kBase_Url, url, GLOBAL_URL_UUID];
    // * * * * * * * * * * * * * * * * 动 画 * * * * * * * * * * * * * * * * * * *//
    CGRect bounds = [[[UIApplication sharedApplication] delegate] window].bounds;
    UIView *blaView = [[UIView alloc] initWithFrame:bounds];
    blaView.backgroundColor = [UIColor clearColor];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:blaView];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blaView animated:YES];
    hud.labelText = @"正在加载...";

    // * * * * * * * * * * * * * *  请 求 配 置 * * * * * * * * * * * * * * * * *//
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",@"text/javascript", nil];
   
    // * * * * * * * * * * * * * *  配 置 解 码 格 式 * * * * * * * * * * * * * * *//
    {
            NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
            manager.responseSerializer.stringEncoding = enc;
    }
    // * * * * * * * * * * * * * * *  请 求 发 起 * * * * * * * * * * * * * * * * //

    [manager GET:comUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    // * * * * * * * * * * * * * * *  请 求 成 功 * * * * * * * * * * * * * * * * //
        [blaView removeFromSuperview];
        if (success) {
            success(responseObject);
            NSLog(@"JSON: %@", operation.responseString);
            NSLog(@"%@", responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
    // * * * * * * * * * * * * * * *  请 求 失 败 移 除 动 画 * * * * * * * * * * * * * * * * //
        if (failure) {
            failure();
        }
        
        NSLog(@"Error: %@", error);
        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络错误,请检查您的网络!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [ale show];
        [blaView removeFromSuperview];
    }];
}

+ (void)POSTDataWithParams:(NSMutableDictionary *)params withUrl:(NSString *)url success:(void (^)(id object))success failure:(dispatch_block_t)failure  withAnimation:(BOOL)animationFlag {
    
    // * * * * * * * * * * * * * * * * 动 画 * * * * * * * * * * * * * * * * * * *//
    
    CGRect bounds = [[[UIApplication sharedApplication] delegate] window].bounds;
    UIView *blaView = [[UIView alloc] initWithFrame:bounds];
    blaView.backgroundColor = [UIColor clearColor];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:blaView];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blaView animated:YES];
    hud.labelText = @"正在加载...";
    
     // * * * * * * * * * * * * * *  请 求 配 置 * * * * * * * * * * * * * * * * *//
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json", @"application/json",@"text/javascript", nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // * * * * * * * * * * * * * *  配 置 解 码 格 式 * * * * * * * * * * * * * * *//
    {
//    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
//    manager.responseSerializer.stringEncoding = enc;
    }
    // * * * * * * * * * * * * * * *  请 求 发 起 * * * * * * * * * * * * * * * * //
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    // * * * * * * * * * * * * * * *  请 求 成 功 * * * * * * * * * * * * * * * * //
        if (success) {
            success(responseObject);
            [blaView removeFromSuperview];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure();
        }
    // * * * * * * * * * * * * * * *  请 求 失 败 移 除 动 画 * * * * * * * * * * * * * * * * //
        NSLog(@"%@", error);
        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络错误,请检查您的网络!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [ale show];
        [blaView removeFromSuperview];
    }];

}



@end
