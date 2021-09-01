//
//  FZRNetworkingData.h
//  FZRNetworking
//
//  Created by FZR on 2021/8/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZRNetworkingData : NSObject

///MARK: 是否是测试
@property(assign, nonatomic) BOOL isDebug;

///MARK: 共享实例
+ (instancetype)sharedInstance ;

@end

NS_ASSUME_NONNULL_END
