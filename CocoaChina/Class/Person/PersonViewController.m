//
//  PersonViewController.m
//  CocoaChina
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wt. All rights reserved.
//

#import "PersonViewController.h"
#import <Flutter/Flutter.h>

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(handleButtonAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"未登录" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}
- (void)handleButtonAction {
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
    flutterViewController.view.backgroundColor = [UIColor whiteColor];
    [flutterViewController setInitialRoute:@"login"];
    [self presentViewController:flutterViewController animated:YES completion:nil];
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
