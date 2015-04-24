//
//  HTLComicsDetailListViewController.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLRootViewController.h"


//所用到的需要参数：argName argValue con
//http://app.u17.com/v3/app/android/phone/list/index?size=40&page=1&argName=theme&argValue=1&con=3
@interface HTLComicsDetailListViewController : HTLRootViewController

@property (nonatomic,copy) NSString * argName;
@property (nonatomic,copy) NSString * argValue;
@property (nonatomic,copy) NSString * argCon;

//用来显示nav标题
@property (nonatomic,copy) NSString * sortName;

@end
