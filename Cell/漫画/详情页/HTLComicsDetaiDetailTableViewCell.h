//
//  HTLComicsDetaiDetailTableViewCell.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTLComicsDetaiDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cover;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *author_name;
@property (weak, nonatomic) IBOutlet UILabel *last_update_time;
@property (weak, nonatomic) IBOutlet UILabel *click_total;
@property (weak, nonatomic) IBOutlet UIButton *collect;
@property (weak, nonatomic) IBOutlet UIButton *read;
@property (weak, nonatomic) IBOutlet UILabel *mydescription;
@property (weak, nonatomic) IBOutlet UILabel *cate_id;
@property (weak, nonatomic) IBOutlet UILabel *theme_ids;



@end
