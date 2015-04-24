//
//  HTLComicsDetaiDetailModel.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTLComicsDetaiDetailModel : NSObject


//简介信息
@property (nonatomic,copy) NSString * comic_id;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * user_id;
@property (nonatomic,copy) NSString * author_name;
@property (nonatomic,copy) NSString * cover;
@property (nonatomic,copy) NSString * ori;
@property (nonatomic,copy) NSString * theme_ids;
@property (nonatomic,copy) NSString * cate_id;
@property (nonatomic,copy) NSString * read_order;
@property (nonatomic,copy) NSString * series_status;
@property (nonatomic,copy) NSString * last_update_time;
@property (nonatomic,copy) NSString * mydescription;
@property (nonatomic,copy) NSString * first_letter;
@property (nonatomic,copy) NSString * last_update_chapter_name;
@property (nonatomic,copy) NSString * last_update_chapter_id;
@property (nonatomic,copy) NSString * is_vip;
@property (nonatomic,copy) NSString * click_total;
@property (nonatomic,copy) NSString * total_tucao;
@property (nonatomic,copy) NSString * month_ticket;
@property (nonatomic,copy) NSString * total_ticket;
@property (nonatomic,copy) NSString * comment_total;
@property (nonatomic,copy) NSString * total_hot;
@property (nonatomic,copy) NSString * is_dub;
@property (nonatomic,copy) NSString * image_all;
@property (nonatomic,copy) NSString * server_time;


//列表信息

//和上边重复@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * image_total;
@property (nonatomic,copy) NSString * chapter_id;
@property (nonatomic,copy) NSString * mySize;
@property (nonatomic,copy) NSString * pass_time;
@property (nonatomic,copy) NSString * release_time;
@property (nonatomic,copy) NSString * type;
@property (nonatomic,copy) NSString * price;
@property (nonatomic,copy) NSString * is_view;
@property (nonatomic,copy) NSString * buyed;
@property (nonatomic,copy) NSString * read_state;



@end
