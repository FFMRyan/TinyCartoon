//
//  HTLCartoonDetailListViewController.m
//  TinyCartoon
//
//  Created by qianfeng on 15/4/24.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLCartoonDetailListViewController.h"

//加载头文件
#import "Header.h"

//网络请求
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"


//model
#import "HTLCartoonDetailListModel.h"

//cell
#import "HTLCartoonDetailListTableViewCell.h"

@interface HTLCartoonDetailListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * cartoonDetailListArray;
    
    UITableView * cartoonListTableView;
}
@end

@implementation HTLCartoonDetailListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化
    [self create];
    
    //补全url
    [self createUrl];
    
    
}
#pragma mark - 初始化
-(void)create
{
    cartoonDetailListArray = [[NSMutableArray alloc]init];
    
    cartoonListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    
    
    cartoonListTableView.delegate = self;
    cartoonListTableView.dataSource = self;
    
    UINib * nib = [UINib nibWithNibName:@"HTLCartoonDetailListTableViewCell" bundle:nil];
    [cartoonListTableView registerNib:nib forCellReuseIdentifier:@"HTLCartoonDetailListTableViewCell"];
    
    
    [self.view addSubview:cartoonListTableView];
    
}
#pragma mark - 补全url
-(void)createUrl
{
    NSString * str = [NSString stringWithFormat:MAOTUANLIST,_myId];
    
    //解析数据
    [self requestURL:str];
    
    
}
#pragma mark - 解析数据
-(void)requestURL:(NSString *)url
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/html", nil];
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        for (NSMutableDictionary * dict in [responseObject objectForKey:@"list"]) {
            
            HTLCartoonDetailListModel * model = [[HTLCartoonDetailListModel alloc]init];
            /**
             video_id;
             name;
             score_person_num
             score_total_num;
             intro;
             area;
             cover;
             charater;
             is_over;
             cur_num;
             total_num;
             category;
             director;
             score;
             update_time;
             topic_intro;
             */
            model.video_id = [dict objectForKey:@"video_id"];
            model.name = [dict objectForKey:@"name"];
            model.score_person_num = [dict objectForKey:@"score_person_num"];
            model.score_total_num = [dict objectForKey:@"score_total_num"];
            model.intro = [dict objectForKey:@"intro"];
            model.area = [dict objectForKey:@"area"];
            model.cover = [dict objectForKey:@"cover"];
            model.charater = [dict objectForKey:@"charater"];
            model.is_over = [dict objectForKey:@"is_over"];
            model.cur_num = [dict objectForKey:@"cur_num"];
            model.total_num = [dict objectForKey:@"total_num"];
            model.category = [dict objectForKey:@"category"];
            model.director = [dict objectForKey:@"director"];
            model.score = [dict objectForKey:@"score"];
            model.update_time = [dict objectForKey:@"update_time"];
            model.topic_intro = [dict objectForKey:@"topic_intro"];
            
            [cartoonDetailListArray addObject:model];
        }
        [cartoonListTableView reloadData];
        
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTLCartoonDetailListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HTLCartoonDetailListTableViewCell"];
    if (cell == nil) {
        cell = [[HTLCartoonDetailListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HTLCartoonDetailListTableViewCell"];
    }
    
    HTLCartoonDetailListModel * model = [cartoonDetailListArray objectAtIndex:indexPath.row];
    /**
     *cover;
     *score;
     *name;
     *update_time
     *area;
     *category;
     *intro;
     
     */
    cell.score.text = model.score;
    cell.name.text =model.name;
    cell.update_time.text =model.update_time;
    cell.area.text =model.area;
    cell.category.text = model.category;
    cell.intro.text = model.intro;
    [cell.cover sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 174.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cartoonDetailListArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HTLComicsDetaiDetailViewController * ddvc = [[HTLComicsDetaiDetailViewController alloc]init];
//    HTLComicsDetailListModel * model = [dataArray objectAtIndex:indexPath.row];
//    
//    ddvc.comicid = model.comic_id;
//    
//    [self.navigationController pushViewController:ddvc animated:YES];
//    
    
}

@end
