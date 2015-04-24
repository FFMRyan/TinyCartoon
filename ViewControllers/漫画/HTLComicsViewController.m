//
//  HTLComicsViewController.m
//  CollegeKnowAll
//
//  Created by qianfeng on 15/4/22.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLComicsViewController.h"

//头部文件
#import "Header.h"

//网络请求
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

//Model
#import "HTLComicsModel.h"

//cell
#import "HTLComicsCollectionViewCell.h"


//详情页列表
#import "HTLComicsDetailListViewController.h"

@interface HTLComicsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    //存放所有数据
    NSMutableArray * sortArray;
    
    //创建collectionview
    UICollectionViewFlowLayout * fl;
    UICollectionView * cv;
    
}
@end

@implementation HTLComicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    //初始化数组
    [self create];
    
    //创建Nav
    [self createNav];
    
    
}
-(void)create
{
    sortArray = [[NSMutableArray alloc]init];
    
    //初始化collectionView
    fl = [[UICollectionViewFlowLayout alloc]init];
    
    //设置滚动方向
    fl.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //初始化collectionView
    cv = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height ) collectionViewLayout:fl];
    //关联xib
    UINib * nib = [UINib nibWithNibName:@"HTLComicsCollectionViewCell" bundle:nil];
    
    [cv registerNib:nib forCellWithReuseIdentifier:@"HTLComicsCollectionViewCell"];
    
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
        button.tag = 200+i;
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
    if (button.tag == 200) {
        
    }else if (button.tag == 201){
        [self requestCategoryURl:U17CATEGORY];
    }
}

-(void)requestCategoryURl:(NSString *)url
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
     manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSMutableDictionary * dicDataStr = [responseObject objectForKey:@"data"];
        
        NSMutableDictionary * strDataStr = [dicDataStr objectForKey:@"returnData"];
        
        for (NSMutableDictionary * categoryDict in [strDataStr objectForKey:@"rankinglist"]) {
            
            NSLog(@"!!!%@",categoryDict);
            /***
             sortId;
             sortName;
             icon;
             cover;
             argCon;
             argName;
             argValue;            
             */
            HTLComicsModel * model = [[HTLComicsModel alloc]init];
            
            model.icon = [categoryDict objectForKey:@"icon"];
            model.cover = [categoryDict objectForKey:@"cover"];
            model.sortId = [categoryDict objectForKey:@"sortId"];
            model.sortName = [categoryDict objectForKey:@"sortName"];
            model.argCon = [categoryDict objectForKey:@"argCon"];
            model.argName = [categoryDict objectForKey:@"argName"];
            model.argValue = [categoryDict objectForKey:@"argValue"];
            
            [sortArray addObject:model];
        }
        
        [cv reloadData];
        
        
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
    
}


#pragma mark - 协议
//返回多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;

}
//每组有多少个
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return sortArray.count;
}
//填充数据
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTLComicsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HTLComicsCollectionViewCell" forIndexPath:indexPath];
    
    HTLComicsModel * model = [sortArray objectAtIndex:indexPath.row];
    cell.sortTitle.text = model.sortName;
    
    [cell.sortImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    
    cell.sortImageView.layer.cornerRadius = 10;
    cell.sortImageView.layer.masksToBounds = YES;
    
    
    
    
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
    HTLComicsDetailListViewController * dlvc = [[HTLComicsDetailListViewController alloc]init];
    HTLComicsModel * model = [sortArray objectAtIndex:indexPath.row];
    dlvc.argValue = model.argValue;
    dlvc.argName = model.argName;
    dlvc.argCon = model.argCon;
    dlvc.sortName = model.sortName;
    
    [self.navigationController pushViewController:dlvc animated:YES];
    
    
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}









@end
