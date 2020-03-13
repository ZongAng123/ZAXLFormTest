//
//  AppDelegate.m
//  XLFormTest
//
//  Created by 纵昂 on 2020/3/13.
//  Copyright © 2020 https://github.com/ZongAng123. All rights reserved.
//  XLForm简书地址:https://www.jianshu.com/p/c7d2fe799b77
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YTKNetworkConfig.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 http://j.asp168.com/anshjcy/api/mess/rechargeRecords
 **/
- (void)setupRequestFilters {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];

    config.baseUrl = BASEURL;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
       
    [self setupRequestFilters];
    
       self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
       self.window.backgroundColor = [UIColor whiteColor];
       
       UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
       [self.window setRootViewController:nav];
    
    
       [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
