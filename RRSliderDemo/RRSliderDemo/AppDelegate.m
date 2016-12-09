//
//  AppDelegate.m
//  RRSliderDemo
//
//  Created by Rochester on 9/12/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "AppDelegate.h"
#import "RRDrawerController.h"
#import "RRCenterViewController.h"
#import "RRLeftViewController.h"
#import "RRRightViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    RRLeftViewController *left = [RRLeftViewController new];
    
    RRCenterViewController *center = [RRCenterViewController new];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:center];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    [tabBarVC addChildViewController:navi];
    tabBarVC.tabBarItem.title = @"哈哈哈";
    
    RRRightViewController *right = [RRRightViewController new];
    
    RRDrawerController *drawer = [[RRDrawerController alloc] initWithLeftController: left centerController:tabBarVC rightController:right];
    
    // 背景图片
    drawer.backgroundImage = [UIImage imageNamed:@"1"];
    // 动画类型
    drawer.drawerControllerStyle = RRDrawerControllerStyleScale;
    // 任何界面都能打开抽屉
    drawer.canOpenDrawerAtAnyPage = YES;
    drawer.minimumScale = 1.0f;
    //...
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = drawer;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
