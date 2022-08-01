//
//  BaseNetworkingManager.h
//  FZRNetworking
//
//  Created by FZR on 2021/8/30.
//

#import <Foundation/Foundation.h>
#import "Prefix-Header.h"
#import "FZRNetworkingData.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNetworkingManager : NSObject

///MARK: 共享实例
+ (instancetype)sharedInstance;

/// MARK: - 开始网络请求 设置Headers
- (void)networkRequestType:(NetworkRequestType)type url:(NSString *)urlString headerParamaters:(NSDictionary *__nullable)headerParamaters paramaters:(NSDictionary *__nullable)paramaters jsonData:(NSData *__nullable)jsonData andDebug:(BOOL)isDebug andblock:(ResultBlock)block;

@end

NS_ASSUME_NONNULL_END
