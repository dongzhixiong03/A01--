//
//  HMImageLoopController.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMImageLoopController.h"
#import "HMHeadLine.h"
#import "HMHeadLineCell.h"
@interface HMImageLoopController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *headLines;

//当前图片的索引
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation HMImageLoopController





static NSString * const reuseIdentifier = @"headline";

//重写set方法,重新加载collectionView
- (void)setHeadLines:(NSArray *)headLines {
    _headLines = headLines;
    
    [self.collectionView reloadData];
    
    
    //加载第二个cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HMHeadLine headLines:^(NSArray *array) {
        self.headLines = array;
    
    }];
    
    //设置cell的样式
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
   
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //等待自动布局结束之后,设置cell的大小
    self.flowLayout.itemSize = self.collectionView.bounds.size;

}



#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.headLines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //计算当前图片的索引
    NSInteger index = (indexPath.item - 1 + self.currentIndex + self.headLines.count ) % self.headLines.count;
    
    //设置页码
    cell.tag = index;
    cell.headLine = self.headLines[index];
    
    return cell;
}


//collectionView滚动停止之后
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //获取滚动的方向   0   2
    int offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    
    //计算currentIndex
    self.currentIndex = (self.currentIndex + offset + self.headLines.count ) % self.headLines.count;
    
    
    
    //加载第二个cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
    
    
    NSLog(@"加载——————--%d",offset);
}


@end
