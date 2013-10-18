//
//  AppDelegate.h
//  MapDots
//
//  Created by siteview_mac on 13-10-12.
//  Copyright (c) 2013年 chenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define STATUS_BAR_HEIGHT       (20)
#define NAVIGATION_BAR_HEIGHT   (44)
#define TAB_BAR_HEIGHT          (49)


#define iPad4_HEIGHT    (1536)
#define iPad4_WIDTH     (2048)

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic, readonly) BOOL isiOS7;
@property (nonatomic, readonly) BOOL isiPhone5;
@property (nonatomic, readonly) BOOL isiPAD;

@end
