//
//  HTLTabBarViewController.m
//  showDemo
//
//  Created by HeTonglu on 15-4-9.
//  Copyright (c) 2015年 HeTonglu. All rights reserved.
//

#import "HTLTabBarViewController.h"



@interface HTLTabBarViewController ()

@end

@implementation HTLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

#define TABBARHEIGHT 59
#pragma mark - 功能：给标签栏添加一个标签项 name：视图控制器的名字
-(void)addTabBarViewController:(NSArray *)name title:(NSArray *)title sourceImage:(NSArray *)sourceImage buttonImage:(NSArray *)buttonImage bgImage:(NSString *)bgImage navBgImage:(NSString *)navBgImage;
{
    //创建tabbar的背景图
    UIImageView * imageTabbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - TABBARHEIGHT, self.view.bounds.size.width, TABBARHEIGHT)];
    imageTabbar.image = [UIImage imageNamed:bgImage];
    
    [self.view addSubview:imageTabbar];
    for (NSUInteger i = 0; i  < name.count; i++) {
        //注意，传入的三个参数均是【NSString *】类型，所以需要转换
        
        

        Class cls = NSClassFromString(name[i]);
        //根据类创建视图控制器
        UIViewController * vc = [[cls alloc]init];
        //最后显示到导航条上
        vc.title = title[i];
        
        
        NSUInteger perWidth = (self.view.bounds.size.width) / (name.count);
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(i * perWidth , 0, perWidth , 49)];
        
        [button setImage:[UIImage imageNamed:sourceImage[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonImage[i]] forState:UIControlStateSelected];
        button.tag = 100 +i;
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20+i * perWidth , 49, perWidth , 10)];
        
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:12];
        
        
        
        //判断中间的
        if(i == 0){
            label.text = title[2];
        }else if (i == 2){
            label.text = title[0];
        }else{
            label.text = title[i];
        }
        
        
        [imageTabbar addSubview:label];
        
        //取消点击时的闪烁
        button.adjustsImageWhenHighlighted = NO;
        
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageTabbar addSubview:button];
        
        UINavigationController * nc = [[UINavigationController alloc]initWithRootViewController:vc];
        
        //设置导航栏不透明
        nc.navigationBar.translucent = YES;
        
        //设置导航条的样式
        nc.navigationBar.barStyle = UIBarStyleBlack;
        
        //设置导航条的镂空颜色
        nc.navigationBar.tintColor = [UIColor whiteColor];
        
        //判断当前设备的系统版本号
        if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
            //设置导航条的颜色
            nc.navigationBar.barTintColor = [UIColor whiteColor];
        }
        
        
        //设置导航条图片
        [nc.navigationBar setBackgroundImage:[UIImage imageNamed:navBgImage] forBarMetrics:UIBarMetricsDefault];
        
        
        //把nc添加到标签栏中
        NSMutableArray *marr = [[NSMutableArray alloc] initWithArray:self.viewControllers];
        [marr addObject:nc];
        
        
        //确定显示中间
        if (i == 4) {
            id tmp = marr[2];
            marr[2] = marr[0];
            marr[0] = tmp;
        }
        self.viewControllers  = marr;
        
    }
    imageTabbar.userInteractionEnabled = YES;
    
 
}
- (void)onClick:(UIButton *)button
{
    //来自父类的切换方式
    self.selectedIndex = button.tag - 100;
    
    button.selected = YES;
    
    for (NSUInteger i = 100; i < 105; i++) {
        UIButton * btn = (id)[self.view viewWithTag:i];
        //如果直系子视图有对应tag会找到，如果没有会深度遍历，找孙子视图
        if (btn == button) {
            continue;
        }
        btn.selected = NO;
    }
}

@end
