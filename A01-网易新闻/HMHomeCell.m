//
//  HMHomeCell.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMHomeCell.h"
#import "HMNewsController.h"


@interface HMHomeCell ()
@property (nonatomic, strong) HMNewsController *vc;
@end

@implementation HMHomeCell
//加载sb中的controller

- (void)awakeFromNib {
    //此方法中从storyboard中加载的
//    NSLog(@"%@",self);
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.vc = [sb instantiateInitialViewController];
    
    [self addSubview:self.vc.view];

}


- (void)setStrUrl:(NSString *)strUrl {
    self.vc.strUrl = strUrl;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.vc.view.frame = self.bounds;
}
@end
