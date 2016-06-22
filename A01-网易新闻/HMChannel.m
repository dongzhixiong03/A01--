//
//  HMChannel.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMChannel.h"

@implementation HMChannel
+ (instancetype)channelWithDic:(NSDictionary *)dic {
    HMChannel *channel = [self new];
    
    [channel setValuesForKeysWithDictionary:dic];
    
    return channel;
}

//请求新闻的地址
- (NSString *)strUrl {
    return [NSString stringWithFormat:@"article/headline/%@/0-140.html",self.tid];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

+ (NSArray *)channels {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *array = dic[@"tList"];
    
    //字典转模型
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *dataDic in array) {
        HMChannel *channel = [self channelWithDic:dataDic];
        [mArray addObject:channel];
    }
    return [mArray sortedArrayUsingComparator:^NSComparisonResult(HMChannel *obj1, HMChannel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}
@end
