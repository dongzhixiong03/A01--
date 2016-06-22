//
//  HMNetworkTools.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMNetworkTools.h"

@implementation HMNetworkTools
+ (instancetype)sharedNetworkTools {
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        instance = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/"] sessionConfiguration:config];
    });
    
    return instance;
}
@end
