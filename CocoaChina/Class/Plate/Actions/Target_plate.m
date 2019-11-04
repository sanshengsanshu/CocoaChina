//
//  Target_plate.m
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import "Target_plate.h"
#import "CommunityViewController.h"
#import "CodeViewController.h"

@implementation Target_plate

- (UIViewController *)Action_NativeToCommunityViewController:(NSDictionary *)params {
    CommunityViewController *vc = [[CommunityViewController alloc] init];
    return vc;
}
- (UIViewController *)Action_NativeToCodeViewController:(NSDictionary *)params {
    CodeViewController *vc = [[CodeViewController alloc] init];
    return vc;
}

@end
