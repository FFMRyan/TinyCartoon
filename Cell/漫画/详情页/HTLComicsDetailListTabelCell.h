//
//  HTLComicsDetailListTabelCell.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTLComicsDetailListTabelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cover;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *click_total;
@property (weak, nonatomic) IBOutlet UILabel *mydescription;

@end
