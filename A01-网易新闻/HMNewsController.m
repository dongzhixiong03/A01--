//
//  HMNewsController.m
//  A01-网易新闻
//
//  Created by teacher on 15/7/22.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMNewsController.h"
#import "HMNews.h"
#import "HMNewsCell.h"
@interface HMNewsController ()
@property (nonatomic, strong) NSArray *newsList;


@end

@implementation HMNewsController

- (void)setNewsList:(NSArray *)newsList {
    _newsList = newsList;
    
    [self.tableView reloadData];
}

//
- (void)setStrUrl:(NSString *)strUrl {
    //在发送异步请求之前,先清空之前的数据
    self.newsList = nil;
    
    [HMNews newsListWithUrl:strUrl completion:^(NSArray *array) {
        NSLog(@"array---%@",array);
         self.newsList = array;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"第一次提交");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HMNews *news = self.newsList[indexPath.row];
    
    
    
    HMNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[HMNewsCell getReuseID:news]];
    
    cell.news = news;
    
    return cell;
}
//代理的方法,返回行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HMNews *news = self.newsList[indexPath.row];
    return [HMNewsCell getRowHeight:news];
}









/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
