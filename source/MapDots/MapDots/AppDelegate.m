//
//  AppDelegate.m
//  MapDots
//
//  Created by chenwei on 13-10-12.
//  Copyright (c) 2013年 siteview_mac. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "EventsViewController.h"
#import "APIKey.h"

@implementation AppDelegate
{
    BMKMapManager* _mapManager;

}
@synthesize tabBarController;
@synthesize isiOS7;
@synthesize isiPhone5;
@synthesize isiPAD;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        isiOS7 = YES;
    } else {
        isiOS7 = NO;
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        isiPAD = YES;
    } else {
        isiPAD = NO;
    }
    
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        if (CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) {
            isiPhone5 = YES;
        } else {
            isiPhone5 = NO;
        }
    } else {
        isiPhone5 = NO;
    }
#ifdef BAIDU_MAPS
    // 要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:BaiduAPIKey generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
#endif
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

        EventsViewController *eventsViewController = [[EventsViewController alloc] init];
        eventsViewController.title = @"话题";
        eventsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"话题" image:[UIImage imageNamed:@"话题_select.png"] tag:102];
        UINavigationController *roomsNavigationController = [[UINavigationController alloc] initWithRootViewController:eventsViewController];

        HomeViewController *navigateViewController = [[HomeViewController alloc] init];
        navigateViewController.title = @"导航";
        navigateViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"导航" image:[UIImage imageNamed:@"导航_select.png"] tag:102];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:navigateViewController];
        
        HomeViewController *meViewController = [[HomeViewController alloc] init];
        meViewController.title = @"我";
        meViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"我_select.png"] tag:102];
        UINavigationController *meNavigationController = [[UINavigationController alloc] initWithRootViewController:meViewController];
        
//        HomeViewController *preferencesViewController = [[HomeViewController alloc] init];
//        preferencesViewController.title = @"设置";
//        preferencesViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:nil tag:104];
//        UINavigationController *preferencesNavigationController = [[UINavigationController alloc] initWithRootViewController:preferencesViewController];
    
        HomeViewController *traceViewController = [[HomeViewController alloc] init];
        traceViewController.title = @"追踪";
        traceViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"追踪" image:[UIImage imageNamed:@"追踪_select.png"] tag:102];
        UINavigationController *traceNavigationController = [[UINavigationController alloc] initWithRootViewController:traceViewController];
        
        tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = @[roomsNavigationController, meNavigationController, meNavigationController, navigationController, traceNavigationController];
        
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
