//
//  FZRNetworking.m
//  FZRNetworking
//
//  Created by FZR on 2021/8/30.
//

#import "FZRNetworking.h"

#import "FZRNetworkingData.h"
#import "BaseNetworkingManager.h"


@implementation FZRNetworking

///MARK: - 开启Debug测试
+(void)startUpDebug{
    
    [FZRNetworkingData sharedInstance].isDebug = YES;
    
}

///MARK: - 最简单的GET请求
+(void)GET:(NSString *)url block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:GET url:url headerParamaters:nil paramaters:nil jsonData:nil andDebug:NO andblock:block];

}

///MARK: - 最简单的POST请求
+(void)POST:(NSString *)url block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:POST url:url headerParamaters:nil paramaters:nil jsonData:nil andDebug:NO andblock:block];

}

///MARK: - 最简单debug的GET请求
+(void)debugtestGET:(NSString *)url block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:GET url:url headerParamaters:nil paramaters:nil jsonData:nil andDebug:YES andblock:block];

}

///MARK: - 最简单debug的POST请求
+(void)debugPOST:(NSString *)url block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:POST url:url headerParamaters:nil paramaters:nil jsonData:nil andDebug:YES andblock:block];

}

///MARK: - 带参数的GET请求
+(void)GET:(NSString *)url paramaters:(NSDictionary *__nullable)paramaters  block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:GET url:url headerParamaters:nil paramaters:paramaters jsonData:nil andDebug:NO andblock:block];

}

///MARK: - 带参数的POST请求
+(void)POST:(NSString *)url paramaters:(NSDictionary *__nullable)paramaters  block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:POST url:url headerParamaters:nil paramaters:paramaters jsonData:nil andDebug:NO andblock:block];

}

///MARK: - 带参数debug的GET请求
+(void)debugtestGET:(NSString *)url paramaters:(NSDictionary *__nullable)paramaters  block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:GET url:url headerParamaters:nil paramaters:paramaters jsonData:nil andDebug:YES andblock:block];

}

///MARK: - 带参数debug的POST请求
+(void)debugPOST:(NSString *)url paramaters:(NSDictionary *__nullable)paramaters  block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:POST url:url headerParamaters:nil paramaters:paramaters jsonData:nil andDebug:YES andblock:block];

}





@end
