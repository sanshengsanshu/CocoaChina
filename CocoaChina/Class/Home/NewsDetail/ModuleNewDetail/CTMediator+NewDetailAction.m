//
//  CTMediator+NewDetailAction.m
//  CocoaChina
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wt. All rights reserved.
//

#import "CTMediator+NewDetailAction.h"
#import <UIKit/UIKit.h>

NSString *const kCTMediatorTarget_NewDetail = @"NewDetail";


NSString *const kCTMediatorAction_NativeToDetailViewController = @"NativeToDetailViewController";


@implementation CTMediator (NewDetailAction)

- (UIViewController *)ttMediatorNewDetailViewControllerWithParams:(NSDictionary *)dict {
    UIViewController *vc = [self performTarget:kCTMediatorTarget_NewDetail action:kCTMediatorAction_NativeToDetailViewController params:dict shouldCacheTarget:YES];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
        
    }else {
        NSLog(@"no create vc:%@", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}

@end
