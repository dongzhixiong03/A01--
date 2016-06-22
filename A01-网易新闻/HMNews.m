//
//  HMNews.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMNews.h"
#import "HMNetworkTools.h"


@implementation HMNews
+ (instancetype)newsWithDic:(NSDictionary *)dic {
    HMNews *news = [HMNews new];
    
    [news setValuesForKeysWithDictionary:dic];
    
    return news;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}

+ (void)newsListWithUrl:(NSString *)strUrl  completion:(void (^)(NSArray *array))completion {
    //保证completion不能为nil
    //断言  判断提交是否成立,条件不成立  抛异常
//    NSAssert(completion != nil, @"completion 不能为nil");
    
    [HMNetworkTools sharedNetworkTools].responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    [[HMNetworkTools sharedNetworkTools] GET:strUrl parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *dic) {
        
        NSString *firstKey = dic.keyEnumerator.nextObject;
        NSArray *array = dic[firstKey];
        
        //字典转模型
        NSMutableArray *mArray = [NSMutableArray array];
        
        for (NSDictionary *dataDic in array) {
            HMNews *news = [HMNews newsWithDic:dataDic];
            [mArray addObject:news];
        }
        //
        NSLog(@"completion---%@",completion);
        if (completion) {
            NSLog(@"hhhhhhhcompletion---%@",completion);
            completion(mArray.copy);
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}
@end
