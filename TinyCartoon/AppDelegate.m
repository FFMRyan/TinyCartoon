//
//  AppDelegate.m
//  TinyCartoon
//
//  Created by qianfeng on 15/4/22.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "AppDelegate.h"
//tabar
#import "HTLTabBarViewController.h"
//推荐
#import "HTLIndexViewController.h"
//漫画
#import "HTLComicsViewController.h"
//动画
#import "HTLCartoonViewController.h"
//爆点
#import "HTLHumorViewController.h"
//个人
#import "HTLMyselfViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    NSUserDefaults* user=[NSUserDefaults standardUserDefaults];
    
    if ([user objectForKey:@"appfirst"]) {
        
        //直接进入主界面
        HTLTabBarViewController * tvc = [[HTLTabBarViewController alloc]init];
        [tvc addTabBarViewController:@[@"HTLIndexViewController",@"HTLCartoonViewController",@"HTLComicsViewController",@"HTLHumorViewController",@"HTLMyselfViewController"] title:@[@"推荐",@"动画",@"漫画",@"爆点",@"个人"] sourceImage:@[@"tabbar_item_tuijian.png",@"tabbar_item_tuijian_select.png",@"tabbar_item_tuijian.png",@"tabbar_item_tuijian_select.png",@"tabbar_item_tuijian.png"] buttonImage:@[@"tabbar_item_tuijian_select.png",@"tabbar_item_tuijian.png",@"tabbar_item_tuijian_select.png",@"tabbar_item_tuijian.png",@"tabbar_item_tuijian_select.png"]  bgImage:@"foot_bg.png" navBgImage:@"navigation_menu_bg.png"];
        
        self.window.rootViewController = tvc;
        
    }else{
        //进入欢迎界面
        
        [user setObject:@"appfirst" forKey:@"appfirst"];
        
    }
    
    [self.window makeKeyAndVisible];

    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
