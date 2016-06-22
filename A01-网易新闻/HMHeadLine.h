//
//  HMHeadLine.h
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHeadLine : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)headLineWithDic:(NSDictionary *)dic;

+ (void)headLines:(void (^)(NSArray *array))completion;
@end
