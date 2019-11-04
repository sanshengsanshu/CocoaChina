//
//  CTMediator+PlateAction.h
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (PlateAction)

- (UIViewController *)ttMediatorCommunityViewControllerWithParams:(NSDictionary *)dict;
- (UIViewController *)ttMediatorCodeViewControllerWithParams:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
