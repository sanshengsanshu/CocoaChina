//
//  TabContentView.m
//  CocoaChina
//
//  Created by Apple on 2019/10/21.
//  Copyright © 2019 wt. All rights reserved.
//

#import "TabContentView.h"

@implementation TabContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}
- (void)initView {
    _pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageController.delegate = self;
    _pageController.dataSource = self;
    _pageController.view.frame = self.bounds;
    [self addSubview:_pageController.view];
    
}
- (void)configParam:(NSMutableArray<UIViewController *> *)controllers index:(NSInteger)index block:(TabSwitchBlock)tabSwitch {
    _tabSwitch = tabSwitch;
    _controllers = controllers;
    _tabSwitch = tabSwitch;
    [_pageController setViewControllers:[NSArray arrayWithObject:[self pageControllerAtIndex:index]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}
- (void)updateTab:(NSInteger)index {
    [_pageController setViewControllers:[NSArray arrayWithObject:[self pageControllerAtIndex:index]] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _pageController.view.frame = self.bounds;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == (_controllers.count - 1)) {
        return nil;
    }
    index++;
    return [self pageControllerAtIndex:index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    index--;
    return [self pageControllerAtIndex:index];
    
}
- (UIViewController *)pageControllerAtIndex:(NSInteger)index {
    return [_controllers objectAtIndex:index];
}
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    NSInteger index = [_controllers indexOfObject:pageViewController.viewControllers[0]];
    _tabSwitch(index);
}

@end
