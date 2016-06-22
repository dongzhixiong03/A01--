//
//  HMNewsCell.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMNewsCell.h"
#import "HMNews.h"
#import <UIImageView+AFNetworking.h>
@interface HMNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *digestView;
@property (weak, nonatomic) IBOutlet UILabel *replyCountView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconViews;

@end

@implementation HMNewsCell

- (void)setNews:(HMNews *)news {
    _news = news;
    self.titleView.text = news.title;
    self.digestView.text = news.digest;
    self.replyCountView.text = [NSString stringWithFormat:@"%d人跟帖", news.replyCount.intValue];
    
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    
    if (news.imgextra) {
        for (int i = 0; i < news.imgextra.count; ++i) {
            //获取图片的路径
            NSDictionary *dic = news.imgextra[i];
            NSString *imgPath = dic[@"imgsrc"];
            //
            UIImageView *imgView = self.iconViews[i];
            [imgView setImageWithURL:[NSURL URLWithString:imgPath]];
            
        }
    }
}


//返回cell的可重用标识
+ (NSString *)getReuseID:(HMNews *)news {
    if (news.imgextra) {
        return @"news1";
    }else if(news.imgType){
        return @"news2";
    }
    
    return @"news";
}


//返回cell的高度
+ (CGFloat)getRowHeight:(HMNews *)news {
    if (news.imgextra) {
        return 140;
    }else if(news.imgType){
        return 150;
    }
    
    return 90;
}

@end
