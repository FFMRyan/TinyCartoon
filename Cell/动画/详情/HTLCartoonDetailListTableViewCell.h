//
//  HTLCartoonDetailListTableViewCell.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/24.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTLCartoonDetailListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cover;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *update_time;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *category;
@property (weak, nonatomic) IBOutlet UILabel *intro;

@end
