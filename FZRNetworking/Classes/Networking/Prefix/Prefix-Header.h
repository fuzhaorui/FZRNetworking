//
//  Prefix-Header.h
//  Pods
//
//  Created by FZR on 2021/8/30.
//

#ifndef Prefix_Header_h
#define Prefix_Header_h

/// MARK: - 请求类型枚举
typedef NSString *NetworkRequestType NS_STRING_ENUM;
/// MARK: get请求
static NetworkRequestType const _Nonnull NetworkRequestTypeGET  = @"GET";
/// MARK: post请求
static NetworkRequestType const _Nonnull NetworkRequestTypePOST = @"POST";

/// MARK: - 请求类型枚举
typedef NSString *NetworkReturnType NS_STRING_ENUM;
/// MARK: 返回dic
static NetworkReturnType const _Nonnull NetworkReturnTypeDic  = @"dic";
/// MARK: 返回data
static NetworkReturnType const _Nonnull NetworkReturnTypeData = @"data";



/// MARK: 数组传值:请求完成返回
typedef void (^__nullable ResultBlock)(NSData * _Nullable data,NSError * _Nullable error);




#endif /* Prefix_Header_h */
