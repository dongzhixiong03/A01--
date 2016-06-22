//
//  HMChannelLabel.h
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMChannelLabel : UILabel
+ (instancetype)channelLabelWithTName:(NSString *)tname;

@property (nonatomic, assign) CGFloat scale;
@end
