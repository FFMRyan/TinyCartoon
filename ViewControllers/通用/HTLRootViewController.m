//
//  HTLRootViewController.m
//  CollegeKnowAll
//
//  Created by qianfeng on 15-4-18.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLRootViewController.h"

@interface HTLRootViewController ()

@end

@implementation HTLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    float a=arc4random()%256/255.0;
    float b=arc4random()%256/255.0;
    float c=arc4random()%256/255.0;
    self.view.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
    
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
