//
//  HMHeadLineCell.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMHeadLineCell.h"
#import "HMHeadLine.h"
#import <UIImageView+AFNetworking.h>
@interface HMHeadLineCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation HMHeadLineCell

- (void)setHeadLine:(HMHeadLine *)headLine {
    
    _headLine = headLine;
    
    self.titleView.text = headLine.title;
    [self.iconView setImageWithURL:[NSURL URLWithString:headLine.imgsrc]];
    //当前显示第几个图片
    self.pageControl.currentPage = self.tag;
    
}


@end
