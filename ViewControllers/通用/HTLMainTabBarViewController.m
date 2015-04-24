//
//  HTLMainTabBarViewController.m
//  CollegeKnowAll
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLMainTabBarViewController.h"
//第三方库
#import "HTLTabBarViewController.h"

//分栏控制器-主页、、、、校园简介
#import "HTLIndexViewController.h"

@interface HTLMainTabBarViewController ()

@end

@implementation HTLMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    HTLTabBarViewController * tvc = [[HTLTabBarViewController alloc]init];
    [tvc addTabBarViewController:@[@"HTLIndexViewController",@"HTLIndexViewController"] title:@[@"主页1",@"主页2"] sourceImage:@[@"user.png",@"highlight_user.png"] buttonImage:@[@"highlight_user.png",@"user.png"]  bgImage:@"foot_bg.png" navBgImage:@"navigation_menu_bg.png"];
    
    [self.navigationController pushViewController:tvc animated:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
