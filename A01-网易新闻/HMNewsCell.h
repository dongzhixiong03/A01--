//
//  HMNewsCell.h
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HMNews;
@interface HMNewsCell : UITableViewCell
@property (nonatomic, strong) HMNews *news;

+ (NSString *)getReuseID:(HMNews *)news;

+ (CGFloat)getRowHeight:(HMNews *)news;

@end
