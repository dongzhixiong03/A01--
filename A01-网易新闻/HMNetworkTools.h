//
//  HMNetworkTools.h
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HMNetworkTools : AFHTTPSessionManager
+ (instancetype)sharedNetworkTools;
@end
