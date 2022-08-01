//
//  BaseNetworkingManager.m
//  FZRNetworking
//
//  Created by FZR on 2021/8/30.
//

#import "BaseNetworkingManager.h"
#import "AFNetworking/AFNetworking.h"

@implementation BaseNetworkingManager

///MARK: 共享实例
+ (instancetype)sharedInstance {
    
    static id _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
    
}

/// MARK: - 开始网络请求 设置Headers
- (void)networkRequestType:(NetworkRequestType)type url:(NSString *)urlString headerParamaters:(NSDictionary *__nullable)headerParamaters paramaters:(NSDictionary *__nullable)paramaters jsonData:(NSData *__nullable)jsonData andDebug:(BOOL)isDebug andblock:(ResultBlock)block{
    
    
    if (FZRNetworkingData.sharedInstance.isDebug || isDebug) {
        
        NSLog(@"请求地址:%@",urlString);
        NSLog(@"请求参数:%@",paramaters);
        
    }

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if (type == GET) {
        
        [manager GET:urlString parameters:paramaters headers:headerParamaters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self success:responseObject andDebug:isDebug andblock:block];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self failure:error andDebug:isDebug andblock:block];
            
        }];
        
    }else{
        
        [manager POST:urlString parameters:paramaters headers:headerParamaters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self success:responseObject andDebug:isDebug andblock:block];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self failure:error andDebug:isDebug andblock:block];
            
        }];
        
    }
    
}

-(void)success:(NSDictionary *)response andDebug:(BOOL)isDebug andblock:(ResultBlock)block{
    
    if (FZRNetworkingData.sharedInstance.isDebug || isDebug) {
        
        NSLog(@"请求结果:%@",response);
        
    }
    block(response,nil);
}

-(void)failure:(NSError *)error andDebug:(BOOL)isDebug andblock:(ResultBlock)block{
    
    if (FZRNetworkingData.sharedInstance.isDebug || isDebug) {
        
        NSLog(@"请求失败:%@",error);
        
    }
    
    block(nil,error);
    
}



@end

