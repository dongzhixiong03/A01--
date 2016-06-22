//
//  HMChannelLabel.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//
#define kBIGFONT 18
#define kSMALLFONT 14
#import "HMChannelLabel.h"

@implementation HMChannelLabel

+ (instancetype)channelLabelWithTName:(NSString *)tname {
    HMChannelLabel *lbl = [self new];
    
    lbl.text = tname;
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font = [UIFont systemFontOfSize:kBIGFONT];
    [lbl sizeToFit];
    
    lbl.font = [UIFont systemFontOfSize:kSMALLFONT];
    
    return lbl;
}


- (void)setScale:(CGFloat)scale {
    
    CGFloat maxScale = kBIGFONT * 1.0 / kSMALLFONT - 1;
    
    self.transform = CGAffineTransformMakeScale(maxScale*scale+1, maxScale*scale + 1);
    
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
    
}

@end
