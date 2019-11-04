//
//  TabContentView.h
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TabSwitchBlock)(NSInteger index);

@interface TabContentView : UIView<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) NSArray<UIViewController *> *controllers;
@property (nonatomic, strong) TabSwitchBlock tabSwitch;

- (void)updateTab:(NSInteger)index;
- (void)configParam:(NSMutableArray<UIViewController *>*)controllers
              index:(NSInteger)index
              block:(TabSwitchBlock)tabSwitch;


@end

NS_ASSUME_NONNULL_END
