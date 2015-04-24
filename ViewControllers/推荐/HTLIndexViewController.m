//
//  HTLIndexViewController.m
//  CollegeKnowAll
//
//  Created by qianfeng on 15-4-20.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLIndexViewController.h"

@interface HTLIndexViewController ()

@end

@implementation HTLIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建Nav
    [self createNav];
}
#pragma mark - Nav
-(void)createNav
{
    UIView * myView = [[UIView alloc]initWithFrame:CGRectMake(80, 0, 280, 44)];
    
    for (NSInteger i = 0;  i < 4;  i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(i*70, 0, 60, 44)];
        if (i == 0) {
            [button setTitle:@"推荐" forState:UIControlStateNormal];
        }else if (i == 1){
            [button setTitle:@"漫画" forState:UIControlStateNormal];
        }else if (i == 2){
            [button setTitle:@"动画" forState:UIControlStateNormal];
        }else if (i == 3){
            [button setTitle:@"爆点" forState:UIControlStateNormal];
        }
        
        button.tag = 400+i;
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        
        [button addTarget:self action:@selector(NavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.layer.cornerRadius = 10;
        button.layer.masksToBounds = YES;
        
        [myView addSubview:button];
    }
    
    self.navigationItem.titleView = myView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)NavButtonOnClick:(UIButton *)button
{
    
}


@end
