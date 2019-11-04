//
//  HomeViewController.m
//  CocoaChina
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wt. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCellNode.h"

@interface HomeViewController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupTableNode];
}
- (void)loadData {
    _dataSource = [NSMutableArray arrayWithCapacity:0];
    [_dataSource addObject:@{@"title":@"我是长标题我是长标题我是长标题我是长标题我是长标题我是长标题", @"content":@"我是长内容我是长内容我是长内容我是长内容我是长内容我是长内容", @"cover":@"https://www.baidu.com/cache/icon/favicon.ico"}];
    [_dataSource addObject:@{@"title":@"我是短标题", @"content":@"我是短内容", @"cover":@"https://www.baidu.com/cache/icon/favicon.ico"}];
    [_dataSource addObject:@{@"title":@"我是长标题我是长标题我是长标题我是长标题", @"content":@"我是长内容我是长内容我是长内容我是长内容", @"cover":@"https://www.baidu.com/cache/icon/favicon.ico"}];
    [_dataSource addObject:@{@"title":@"我是短标题", @"content":@"我是短内容", @"cover":@"https://www.baidu.com/cache/icon/favicon.ico"}];
    NSLog(@"_dataSource:%@", _dataSource);
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _tableNode.frame = self.view.bounds;
}
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.dataSource[indexPath.row];
    return ^{
        HomeCellNode *cell = [[HomeCellNode alloc] initWithDict:dict];
        return cell;
    };
}
- (ASSizeRange)tableView:(ASTableView *)tableView constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize min = CGSizeMake(width, 0);
    CGSize max = CGSizeMake(width, HUGE_VALF);//HUGE_VALF
    return ASSizeRangeMake(min, max);
}
- (void)setupTableNode {
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode.backgroundColor = [UIColor whiteColor];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.view.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubnode:_tableNode];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
