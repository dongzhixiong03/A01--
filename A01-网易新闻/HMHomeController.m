//
//  HMHomeController.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMHomeController.h"
#import "HMChannel.h"
#import "HMChannelLabel.h"
#import "HMHomeCell.h"
@interface HMHomeController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray *channels;

//当前高亮显示label的索引
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation HMHomeController

- (NSArray *)channels {
    if (_channels == nil) {
        _channels = [HMChannel channels];
    }
    return _channels;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //要获取collectionView的大小 此处获取的大小.是从sb中加载
    //等待自动布局viewDidLayoutSubviews好之后,再获取collectionView的大小
    
    //让导航控制器,不自动修改scrollView的contentInsets
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self loadChannels];
    
    
   
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //flowlayout
    self.flowLayout.itemSize = self.collectionView.bounds.size;
}

//加载频道
- (void)loadChannels {
    CGFloat height = self.scrollView.bounds.size.height;
    CGFloat marginX = 5;
    CGFloat x = marginX;
    
    for (HMChannel *channel in self.channels) {
        //生成label
        HMChannelLabel *lbl = [HMChannelLabel channelLabelWithTName:channel.tname];
        [self.scrollView addSubview:lbl];
        
        lbl.frame = CGRectMake(x, 0, lbl.bounds.size.width, height);
        x += lbl.bounds.size.width + marginX;
    }
    
    //设置scrollView滚动
    self.scrollView.contentSize = CGSizeMake(x, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    
    //让第一个label默认放大
    HMChannelLabel *lbl = self.scrollView.subviews[self.currentIndex];
    lbl.scale = 1;
    
}

//数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"home" forIndexPath:indexPath];
    
    
    //当前显示的channel
    HMChannel *channel = self.channels[indexPath.item];
    cell.strUrl = channel.strUrl;
    
    return cell;
    
}




//collectionView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //找到当前的label和下一个label
    HMChannelLabel *currentLabel = self.scrollView.subviews[self.currentIndex];
    
    HMChannelLabel *nextLabel = nil;
    //获取collectionView中当前正在显示的cell
    
    NSArray *array = [self.collectionView indexPathsForVisibleItems];
    for (NSIndexPath *indexPath in array) {
        if (indexPath.item != self.currentIndex) {
            nextLabel = self.scrollView.subviews[indexPath.item];
            break;
        }
    }
    
    if (nextLabel == nil) {
        return;
    }
    
    //动画的方式放大文字
    CGFloat nextScale = ABS(scrollView.contentOffset.x / scrollView.bounds.size.width - self.currentIndex);
    CGFloat currentScale = 1 - nextScale;
    
    
    currentLabel.scale = currentScale;
    nextLabel.scale = nextScale;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //当前的索引
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
}



@end
