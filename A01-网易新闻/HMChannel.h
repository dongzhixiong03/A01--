//
//  HMChannel.h
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMChannel : NSObject
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *tid;

//请求新闻的地址  tid
@property (nonatomic, copy, readonly) NSString *strUrl;


+ (instancetype)channelWithDic:(NSDictionary *)dic;

+ (NSArray *)channels;
@end
