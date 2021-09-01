//
//  BaseNetworkingManager.m
//  FZRNetworking
//
//  Created by FZR on 2021/8/30.
//

#import "BaseNetworkingManager.h"

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
- (void)networkRequestType:(NetworkRequestType)type url:(NSString *)urlString headerParamaters:(NSDictionary *__nullable)headerParamaters paramaters:(NSDictionary *__nullable)paramaters  jsonData:(NSData *__nullable)jsonData block:(ResultBlock)block{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        if (FZRNetworkingData.sharedInstance.isDebug) {
            NSLog(@"\n< Debug Request Info >\n url:%@ \n paramaters:%@ \n jsonData:%@ \n ",urlString,paramaters,[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding]);
        }
        
        NSURL *url = [NSURL URLWithString:urlString];;
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
        
        if (headerParamaters) {
            
            NSMutableURLRequest *mutableRequest = [request mutableCopy];
            
            [headerParamaters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL *_Nonnull stop) {
                [mutableRequest addValue:obj forHTTPHeaderField:key];
            }];
            
            request = [mutableRequest copy];
            
        }
        
        // 1.设置请求方法:
        request.HTTPMethod = type;
        
        // 2.设置请求体
        if (jsonData == nil) {
            
            NSData *bodyData;

            if (type == NetworkRequestTypePOST) {
                
                NSMutableString *strM = [[NSMutableString alloc] init];
                
                [paramaters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL *_Nonnull stop) {
                    
                    // 服务器接收参数的 key 值.
                    
                    NSString *paramaterKey = key;
                    
                    // 参数内容
                    
                    NSString *paramaterValue = obj;
                    
                    // appendFormat :可变字符串直接拼接的方法!
                    
                    [strM appendFormat:@"%@=%@&",paramaterKey,paramaterValue];
                    
                }];
                
                NSString *body = [strM substringToIndex:strM.length - 1];
                
                bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
                
                url = [NSURL URLWithString:urlString];
                
            }
            else{
                
                if (paramaters) {
                    
                    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@&%@",urlString,[self mosaicParameter:paramaters]]];
                    
                }
                else{
                    
                    url = [NSURL URLWithString:urlString];
                    
                }
                
                
            }
            
            request.HTTPBody = bodyData;
            
        }else{
            
            request.HTTPBody = jsonData;
            
        }
        
        
        // 2. 发送网络请求.
        
        // completionHandler: 说明网络请求完成!
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
            block(data,error);
          
        }] resume];
        
    });
        
}


- (NSString *)mosaicParameter:(NSDictionary *)dic
{
    NSArray  *keys= [dic allKeys];
    NSString *string = @"";
    for(int i=0;i<[keys count];i++)
    {
        NSString *key=[keys objectAtIndex:i];
        if (i==0) {
            string = [NSString stringWithFormat:@"%@=%@",key,[dic objectForKey:key]];
        }
        else
        {
            string = [NSString stringWithFormat:@"%@&%@=%@",string,key,[dic objectForKey:key]];
        }
    }
    
    string = [string stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    return string;
}

@end

