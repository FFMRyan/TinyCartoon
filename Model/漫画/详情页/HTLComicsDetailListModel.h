//
//  HTLComicsDetailListModel.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTLComicsDetailListModel : NSObject

@property (nonatomic,copy) NSString * comic_id;
@property (nonatomic,copy) NSString * name;
//图片
@property (nonatomic,copy) NSString * cover;
@property (nonatomic,copy) NSString * accredit;
@property (nonatomic,copy) NSString * last_update_time;
@property (nonatomic,copy) NSString * last_update_chapter_name;
@property (nonatomic,copy) NSString * mydescription;
@property (nonatomic,copy) NSString * user_id;
@property (nonatomic,copy) NSString * nickname;
@property (nonatomic,copy) NSString * series_status;
@property (nonatomic,copy) NSString * theme_ids;
@property (nonatomic,copy) NSString * is_dujia;
//总点数
@property (nonatomic,copy) NSString * extraValue;
@property (nonatomic,copy) NSString * click_total;


@end
