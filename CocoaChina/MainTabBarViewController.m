//
//  MainTabBarViewController.m
//  CocoaChina
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wt. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomeViewController.h"
#import "PlateViewController.h"
#import "PersonViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (instancetype)init {
   if (!(self = [super init])) {
       return nil;
   }
    CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController];
//   self.navigationController.navigationBar.hidden = YES;
   return (self = (MainTabBarViewController *)tabBarController);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)viewControllers {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    CYLBaseNavigationController *homeNavigationController = [[CYLBaseNavigationController alloc] initWithRootViewController:homeViewController];
    [homeViewController cyl_setHideNavigationBarSeparator:YES];
    
    PlateViewController *plateViewController = [[PlateViewController alloc] init];
    CYLBaseNavigationController *plateNavigationController = [[CYLBaseNavigationController alloc] initWithRootViewController:plateViewController];
    [plateViewController cyl_setHideNavigationBarSeparator:YES];
    
    PersonViewController *personViewController = [[PersonViewController alloc] init];
    CYLBaseNavigationController *personNavigationController = [[CYLBaseNavigationController alloc] initWithRootViewController:personViewController];
    [personViewController cyl_setHideNavigationBarSeparator:YES];
    NSArray *viewControllers = @[
                                homeNavigationController,
                                plateNavigationController,
                                personNavigationController,
                                ];
    return viewControllers;
}
- (NSArray *)tabBarItemsAttributesForController {
   NSDictionary *homeTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"home",
                                                CYLTabBarItemImage : @"home_normal",  /* NSString and UIImage are supported*/
                                                CYLTabBarItemSelectedImage : @"home_highlight",  /* NSString and UIImage are supported*/
                                                };
    NSDictionary *plateTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : @"plate",
                                                CYLTabBarItemImage : @"plate_normal",
                                                CYLTabBarItemSelectedImage : @"plate_highlight",
                                                };
   NSDictionary *personTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"person",
                                                 CYLTabBarItemImage : @"person_normal",
                                                 CYLTabBarItemSelectedImage : @"person_highlight",
                                                 };
   

   NSArray *tabBarItemsAttributes = @[
                                      homeTabBarItemsAttributes,
                                      plateTabBarItemsAttributes,
                                      personTabBarItemsAttributes,
                                      ];
   return tabBarItemsAttributes;
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
