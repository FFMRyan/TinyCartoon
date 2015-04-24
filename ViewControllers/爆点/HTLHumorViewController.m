//
//  HTLHumorViewController.m
//  CollegeKnowAll
//
//  Created by qianfeng on 15/4/22.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLHumorViewController.h"

@interface HTLHumorViewController ()

@end

@implementation HTLHumorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //创建nav
    [self createNav];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createNav
{
    UIView * myView = [[UIView alloc]initWithFrame:CGRectMake(80, 0, 280, 44)];
    
    for (NSInteger i = 0 ; i < 2; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(50+i*90, 0, 80, 44)];
        if (i == 0) {
            [button setTitle:@"历史" forState:UIControlStateNormal];
        }
        if (i == 1) {
            [button setTitle:@"全部" forState:UIControlStateNormal];
        }
        button.tag = 500+i;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [myView addSubview:button];
    }
    
    self.navigationItem.titleView = myView;
    
    
}

-(void)buttonOnClick:(UIButton *)button
{
    
}

@end
