//
//  HTLComicsDetailListViewController.m
//  TinyCartoon
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLComicsDetailListViewController.h"
#import "Header.h"

//网络加载和图片列表
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

//model
#import "HTLComicsDetailListModel.h"

//cell
#import "HTLComicsDetailListTabelCell.h"


//详情页
#import "HTLComicsDetaiDetailViewController.h"

@interface HTLComicsDetailListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    //创建数组
    NSMutableArray * dataArray;
    
    //创建table
    UITableView * myTableView;
    
}
@end

@implementation HTLComicsDetailListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据
    [self create];
    
    //首先补全URL
    [self createURL];
}
-(void)create
{
    dataArray = [[NSMutableArray alloc]init];
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    UINib * nib = [UINib nibWithNibName:@"HTLComicsDetailListTabelCell" bundle:nil];
    [myTableView registerNib:nib forCellReuseIdentifier:@"HTLComicsDetailListTabelCell"];
    
    [self.view addSubview:myTableView];
    
    
}
#pragma mark - 补全URL
-(void)createURL
{
    NSString * str = [[NSString alloc]initWithFormat:U17CATEGORYLIST,_argName,_argValue,_argCon];
    //解析数据
    [self requestURL:str];
}
#pragma mark - 解析数据
-(void)requestURL:(NSString *)url
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/html", nil];
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        NSMutableDictionary * dicDataStr = [responseObject objectForKey:@"data"];
        
        for (NSMutableDictionary * strDataStr in [dicDataStr objectForKey:@"returnData"]) {
            HTLComicsDetailListModel * model = [[HTLComicsDetailListModel alloc]init];
            /**
             comic_id;
             name;
             cover;
             accredit;
             last_update_time;
             last_update_chapter_name;
             mydescription;
             user_id;
             nickname;
             series_status;
             theme_ids;
             is_dujia;
             extraValue;
             click_total;
             */
            model.comic_id = [strDataStr objectForKey:@"comic_id"];
            model.name = [strDataStr objectForKey:@"name"];
            model.cover = [strDataStr objectForKey:@"cover"];
            model.accredit = [strDataStr objectForKey:@"accredit"];
            model.last_update_time = [strDataStr objectForKey:@"last_update_time"];
            model.last_update_chapter_name = [strDataStr objectForKey:@"last_update_chapter_name"];
            model.mydescription = [strDataStr objectForKey:@"description"];
            model.user_id =[strDataStr objectForKey:@"user_id"];
            model.nickname = [strDataStr objectForKey:@"nickname"];
            model.series_status = [strDataStr objectForKey:@"series_status"];
            model.theme_ids = [strDataStr objectForKey:@"theme_ids"];
            model.is_dujia = [strDataStr objectForKey:@"is_dujia"];
            model.extraValue = [strDataStr objectForKey:@"extraValue"];
            model.click_total = [strDataStr objectForKey:@"click_total"];
            [dataArray addObject:model];
            
        }
        [myTableView reloadData];

        
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed");
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTLComicsDetailListTabelCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HTLComicsDetailListTabelCell"];
    if (cell == nil) {
        cell = [[HTLComicsDetailListTabelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HTLComicsDetailListTabelCell"];
    }
    
    HTLComicsDetailListModel * model = [dataArray objectAtIndex:indexPath.row];
    /**
      *cover;
     *name;
     *nickname;
     *click_total;
     *mydescription;
     
     */
    cell.name.text = model.name;
    cell.nickname.text = model.nickname;
    cell.click_total.text = model.click_total;
    cell.mydescription.text = model.mydescription;
    
    [cell.cover sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTLComicsDetaiDetailViewController * ddvc = [[HTLComicsDetaiDetailViewController alloc]init];
    HTLComicsDetailListModel * model = [dataArray objectAtIndex:indexPath.row];
    
    ddvc.comicid = model.comic_id;
    
    [self.navigationController pushViewController:ddvc animated:YES];
    
    
}

@end
