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
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:NetworkRequestTypeGET url:url headerParamaters:nil paramaters:nil jsonData:nil block:block];

}

///MARK: - 最简单的POST请求
+(void)POST:(NSString *)url block:(ResultBlock)block{
    
    [[BaseNetworkingManager sharedInstance] networkRequestType:NetworkRequestTypePOST url:url headerParamaters:nil paramaters:nil jsonData:nil block:block];

}

@end
