//
//  HTLCartoonModel.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/24.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTLCartoonModel : NSObject

@property (nonatomic,copy) NSString * cartoonId;
@property (nonatomic,copy) NSString * cartoonName;
@property (nonatomic,copy) NSString * cartoonPic;
@property (nonatomic,assign) BOOL  cartoonIsLock;



@end
