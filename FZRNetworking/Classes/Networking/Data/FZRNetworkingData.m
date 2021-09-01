//
//  FZRNetworkingData.m
//  FZRNetworking
//
//  Created by FZR on 2021/8/30.
//

#import "FZRNetworkingData.h"

@implementation FZRNetworkingData

///MARK: 共享实例
+ (instancetype)sharedInstance {
    
    static id _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
    
}

///MARK: 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
    
        self.isDebug = NO;
        
    }
    return self;
}

@end
