//
//  AppDelegate.h
//  CocoaChina
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 wt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Flutter/Flutter.h>

@interface AppDelegate : FlutterAppDelegate <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;
@property (strong, nonatomic) UIWindow *window;

- (void)saveContext;


@end

