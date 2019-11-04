//
//  Target_NewDetail.m
//  CocoaChina
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wt. All rights reserved.
//

#import "Target_NewDetail.h"
#import "NewDetailViewController.h"

@implementation Target_NewDetail

- (UIViewController *)Action_NativeToDetailViewController:(NSDictionary *)params {
    NewDetailViewController *vc = [[NewDetailViewController alloc] init];
    return vc;
}

@end
