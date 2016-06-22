//
//  HMHeadLine.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMHeadLine.h"
#import <objc/runtime.h>
#import "HMNetworkTools.h"
@implementation HMHeadLine
+ (instancetype)headLineWithDic:(NSDictionary *)dic {
    HMHeadLine *headLine = [self new];
    
    for (NSString *name in [self getProperties]) {
        [headLine setValue:dic[name] forKey:name];
    }
    
    return headLine;
}
//发送请求.获取数据,转换成模型数组
+ (void)headLines:(void (^)(NSArray *))completion {
    
    [[HMNetworkTools sharedNetworkTools] GET:@"ad/headline/0-4.html" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *dic) {
        
        //获取数组  headline_ad
        NSString *firstKey = dic.keyEnumerator.nextObject;
        NSArray *array = dic[firstKey];
        //字典转模型
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dataDic in array) {
            HMHeadLine *headLine = [self headLineWithDic:dataDic];
            [mArray addObject:headLine];
        }
        //在主线程执行
        if (completion) {
            completion(mArray.copy);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}

//获取当前类的所有属性  runtime
+ (NSArray *)getProperties {
    unsigned int count;
    //获取所有属性,返回的是属性的数组
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
        const char *cName = property_getName(property);
        //c语言的字符串,转换成oc中的字符串
        NSString *ocName = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:ocName];
    }
    return mArray.copy;
}
@end
