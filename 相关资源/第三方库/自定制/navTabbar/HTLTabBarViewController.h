//
//  HTLTabBarViewController.h
//  showDemo
//
//  Created by HeTonglu on 15-4-9.
//  Copyright (c) 2015年 HeTonglu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTLTabBarViewController : UITabBarController


/**
 详情：高度设置的是 49 ，如需修改，可以修改宏定义  内置的是Button 其tag值设置的是100+数量，因此在引用本文件时，不建议引用100-105之间的tag值
 
 功能：给标签栏添加一个标签项
 
 参数：
    1）name：视图控制器的名字 不用添加.h 这是个数组
    2）title：传入的界面标题 数组
    3）sourceImage：标题上面的图片
    4）buttonImage：点击后的图片
    5）bgImage tabbar的整体背景
 */

-(void)addTabBarViewController:(NSArray *)name title:(NSArray *)title sourceImage:(NSArray *)sourceImage buttonImage:(NSArray *)buttonImage bgImage:(NSString *)bgImage navBgImage:(NSString *)navBgImage;



@end
