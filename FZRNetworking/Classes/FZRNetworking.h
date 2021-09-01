//
//  FZRNetworking.h
//  FZRNetworking
//
//  Created by FZR on 2021/8/30.
//


#import <Foundation/Foundation.h>
#import "Prefix-Header.h"
NS_ASSUME_NONNULL_BEGIN

@interface FZRNetworking : NSObject

///MARK: - 开启Debug测试
+(void)startUpDebug;

///MARK: - 最简单的GET请求
+(void)GET:(NSString *)url block:(ResultBlock)block;

///MARK: - 最简单的POST请求
+(void)POST:(NSString *)url block:(ResultBlock)block;


@end

NS_ASSUME_NONNULL_END
