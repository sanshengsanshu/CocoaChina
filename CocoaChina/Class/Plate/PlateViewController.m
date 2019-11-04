//
//  PlateViewController.m
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import "PlateViewController.h"
#import "CTMediator+PlateAction.h"
#import "TabScrollView.h"
#import "TabContentView.h"

@interface PlateViewController ()

@property (nonatomic, strong) TabScrollView *tabScrollView;
@property (nonatomic, strong) TabContentView *tabContentView;
@property (nonatomic, strong) NSMutableArray *tabs;
@property (nonatomic, strong) NSMutableArray *contents;

@end

@implementation PlateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"板块";
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.navigationController.navigationBar.translucent = NO;
    _tabs = [NSMutableArray arrayWithCapacity:0];
    _contents = [NSMutableArray arrayWithCapacity:0];
    

    UILabel *tab1 = [[UILabel alloc] init];
    tab1.textAlignment=NSTextAlignmentCenter;
    tab1.text = @"社区";
    tab1.textColor = [UIColor blackColor];
    [_tabs addObject:tab1];
    UILabel *tab2 = [[UILabel alloc] init];
    tab2.textAlignment=NSTextAlignmentCenter;
    tab2.text = @"代码";
    tab2.textColor = [UIColor blackColor];
    [_tabs addObject:tab2];
    
    
    UIViewController *com = [[CTMediator sharedInstance] ttMediatorCommunityViewControllerWithParams:@{@"tag":@"社区"}];
    [_contents addObject:com];
    UIViewController *code = [[CTMediator sharedInstance] ttMediatorCodeViewControllerWithParams:@{@"tag":@"代码"}];
    [_contents addObject:code];
    
    _tabScrollView = [[TabScrollView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tabScrollView];
    [_tabScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@44);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    [_tabScrollView configParameter:horizontal viewArray:_tabs tabWidth:60 tabHeight:44 tagIndex:0 block:^(NSInteger index) {
        [self->_tabContentView updateTab:index];
    }];
    _tabContentView = [[TabContentView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tabContentView];
    [_tabContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_tabScrollView.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
    [_tabContentView configParam:_contents index:0 block:^(NSInteger index) {
        [self->_tabScrollView updateTagLine:index];
    }];
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
