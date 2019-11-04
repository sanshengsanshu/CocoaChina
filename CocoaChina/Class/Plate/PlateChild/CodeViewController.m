//
//  CodeViewController.m
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()
@property (nonatomic, assign) BOOL isFrist;
@property (nonatomic, strong) UILabel *tips;

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFrist = false;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tips = [[UILabel alloc] init];
    [self.view addSubview:_tips];
    [_tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    if(!_isFrist){
        //第一次进入,自动加载数据
        _tips.text = @"代码";
        _isFrist = true;
    }else{
        //不是第一次进入,不加载数据
    }
    
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
