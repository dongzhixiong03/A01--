//
//  HMNews.h
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNews : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *digest; //新闻摘要
@property (nonatomic, copy) NSNumber *replyCount;

@property (nonatomic, copy) NSNumber *imgType;

@property (nonatomic, copy) NSArray *imgextra;

+ (instancetype)newsWithDic:(NSDictionary *)dic;
+ (void)newsListWithUrl:(NSString *)strUrl  completion:(void (^)(NSArray *array))completion;
@end
