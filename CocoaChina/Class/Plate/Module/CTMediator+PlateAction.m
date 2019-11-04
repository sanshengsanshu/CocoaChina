//
//  CTMediator+PlateAction.m
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMediator+PlateAction.h"

NSString *const kCTMediatorTarget_plate = @"plate";

NSString *const kCTMediatorAction_NativeToCommunityViewController = @"NativeToCommunityViewController";
NSString *const kCTMediatorAction_NativeToCodeViewController = @"NativeToCodeViewController";


@implementation CTMediator (PlateAction)
- (UIViewController *)ttMediatorCommunityViewControllerWithParams:(NSDictionary *)dict {
    UIViewController *vc = [self performTarget:kCTMediatorTarget_plate action:kCTMediatorAction_NativeToCommunityViewController params:dict shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
        
    }else {
        NSLog(@"no create vc:%@", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}
- (UIViewController *)ttMediatorCodeViewControllerWithParams:(NSDictionary *)dict {
    UIViewController *vc = [self performTarget:kCTMediatorTarget_plate action:kCTMediatorAction_NativeToCodeViewController params:dict shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
        
    }else {
        NSLog(@"no create vc:%@", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}

@end
