//
//  DownLoadOperation.h
//  Dispatch
//
//  Created by iOSDevTip on 14-10-20.
//  Copyright (c) 2014年 http://iswifting.com All rights reserved.
//

// 微信公众账号：iOSDevTip
// http://iswifting.com  swift学习社区


#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@interface DownLoadOperation : NSObject

@property(nonatomic , strong) NSURL* url;
@property(nonatomic , copy) NSString* (^cachePath)(void);
@property(nonatomic , strong) AFHTTPRequestOperation* requestOperation;
@property(nonatomic , copy) void(^progressBlock)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead);


-(void)downloadWithUrl:(id)url
             cachePath:(NSString* (^) (void))cacheBlock
         progressBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))progressBlock
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
