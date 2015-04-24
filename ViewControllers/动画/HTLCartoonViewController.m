//
//  HTLCartoonViewController.m
//  CollegeKnowAll
//
//  Created by qianfeng on 15/4/22.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLCartoonViewController.h"
//加载头文件
#import "Header.h"

//网络请求
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

//model
#import "HTLCartoonModel.h"

//cell和xib 复用漫画
#import "HTLCartoonCollectionViewCell.h"

//跳转list详情
#import "HTLCartoonDetailListViewController.h"

@interface HTLCartoonViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    //存储数据
    NSMutableArray * cartoonArray;
    
    //创建collectionview
    UICollectionViewFlowLayout * fl;
    UICollectionView * cv;
}
@end

@implementation HTLCartoonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化数据
    [self create];
    
    //创建Nav
    [self createNav];

}
-(void)create
{
    cartoonArray = [[NSMutableArray alloc]init];
    
    //初始化collectionView
    fl = [[UICollectionViewFlowLayout alloc]init];
    
    //设置滚动方向
    fl.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //初始化collectionView
    cv = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height ) collectionViewLayout:fl];
    //关联xib //此处xib 借用漫画的
    UINib * nib = [UINib nibWithNibName:@"HTLCartoonCollectionViewCell" bundle:nil];
    
    [cv registerNib:nib forCellWithReuseIdentifier:@"HTLCartoonCollectionViewCell"];
    
    //设置代理
    cv.delegate =self;
    
    cv.dataSource = self;
    
    cv.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:cv];
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
        button.tag = 300+i;
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
    if (button.tag == 300) {
        
    }else if (button.tag == 301){
        [self requestCategoryURl:MAOTUAN];
    }
    
}
-(void)requestCategoryURl:(NSString *)url
{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/html", nil];
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
       for (NSMutableDictionary * dict in [responseObject[1] objectForKey:@"list"]) {
           HTLCartoonModel * model = [[HTLCartoonModel alloc]init];
           model.cartoonId = [dict objectForKey:@"id"];
           model.cartoonName = [dict objectForKey:@"name"];
           model.cartoonPic = [dict objectForKey:@"pic"];
           model.cartoonIsLock = [dict objectForKey:@"is_lock"];
           
           if (model.cartoonIsLock) {
               [cartoonArray addObject:model];
           }
         }
        
        [cv reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"false");
    }];
    
}

#pragma mark - 协议
#pragma mark - 协议
//返回多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}
//每组有多少个
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return cartoonArray.count;
}
//填充数据
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTLCartoonCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HTLCartoonCollectionViewCell" forIndexPath:indexPath];
    
    HTLCartoonModel * model = [cartoonArray objectAtIndex:indexPath.row];
    cell.cartoonTitle.text = model.cartoonName;
    
    [cell.cartoonImageView sd_setImageWithURL:[NSURL URLWithString:model.cartoonPic]];
    
    cell.cartoonImageView.layer.cornerRadius = 10;
    cell.cartoonImageView.layer.masksToBounds = YES;
    
    
    
    
    return cell;
}
//返回每个Item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100 , 118);
}
//显示返回这一行的Item距离两边和顶部、底部的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5,0, 5);
}
//返回每个Item之间的最小距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0f;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTLCartoonDetailListViewController * dlvc = [[HTLCartoonDetailListViewController alloc]init];
    HTLCartoonModel * model = [cartoonArray objectAtIndex:indexPath.row];
    dlvc.myId = model.cartoonId;
    
    [self.navigationController pushViewController:dlvc animated:YES];
    
    
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}




@end
