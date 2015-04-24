//
//  HTLComicsDetaiDetailViewController.m
//  TinyCartoon
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#import "HTLComicsDetaiDetailViewController.h"
#import "Header.h"


//网络和其他
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

//model
#import "HTLComicsDetaiDetailModel.h"

//cell
#import "HTLComicsDetaiDetailTableViewCell.h"

@interface HTLComicsDetaiDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * topArray;
    NSMutableArray * listArray;
    
    UITableView * mytableView;
}
@end

@implementation HTLComicsDetaiDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化
    [self create];
    
    
    //补全URL
    [self createURL];
}
-(void)create
{
    topArray =[[NSMutableArray alloc]init];
    listArray = [[NSMutableArray alloc]init];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    UINib * nib = [UINib nibWithNibName:@"HTLComicsDetaiDetailTableViewCell" bundle:nil];
    [mytableView registerNib:nib forCellReuseIdentifier:@"HTLComicsDetaiDetailTableViewCell"];
    
    [self.view addSubview:mytableView];
    
}

-(void)createURL
{
    NSString * str = [NSString stringWithFormat:U17CATEGORYLISTDETAIL,_comicid];
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
        
        NSMutableDictionary * strDataStr = [dicDataStr objectForKey:@"returnData"];
        
        
        NSMutableDictionary * comicDict = [strDataStr objectForKey:@"comic"];
        

//        for (NSMutableDictionary * comicDict in [strDataStr objectForKey:@"comic"]) {
        
            HTLComicsDetaiDetailModel * model = [[HTLComicsDetaiDetailModel alloc]init];
            
            /**
             comic_id;
             name;
             user_id;
             author_name;
             cover;
             ori;
             theme_ids;
             cate_id;
             read_order;
             series_status;
             last_update_time;
             mydescription;
             
             **/
            model.comic_id = [comicDict objectForKey:@"comic_id"];
            model.name = [comicDict objectForKey:@"name"];
            model.user_id = [comicDict objectForKey:@"user_id"];
            model.author_name = [comicDict objectForKey:@"author_name"];
            model.cover = [comicDict objectForKey:@"cover"];
            model.ori = [comicDict objectForKey:@"ori"];
            model.theme_ids = [comicDict objectForKey:@"theme_ids"];
            model.cate_id = [comicDict objectForKey:@"cate_id"];
            model.read_order = [comicDict objectForKey:@"read_order"];
            model.series_status = [comicDict objectForKey:@"series_status"];
            model.last_update_time = [comicDict objectForKey:@"last_update_time"];
            model.mydescription = [comicDict objectForKey:@"description"];
             /**
             first_letter;
             last_update_chapter_name;
             last_update_chapter_id;
             is_vip;
             click_total;
             total_tucao;
             month_ticket;
             total_ticket;
             comment_total;
             total_hot;
             is_dub;
             image_all;
             server_time;
             */
            model.first_letter = [comicDict objectForKey:@"first_letter"];
            model.last_update_chapter_name = [comicDict objectForKey:@"last_update_chapter_name"];
            model.last_update_chapter_id = [comicDict objectForKey:@"last_update_chapter_id"];
            model.is_vip = [comicDict objectForKey:@"is_vip"];
            model.click_total = [comicDict objectForKey:@"click_total"];
            model.total_tucao = [comicDict objectForKey:@"total_tucao"];
            model.month_ticket = [comicDict objectForKey:@"month_ticket"];
            model.total_ticket = [comicDict objectForKey:@"total_ticket"];
            model.comment_total = [comicDict objectForKey:@"comment_total"];
            model.total_hot = [comicDict objectForKey:@"total_hot"];
            model.is_dub = [comicDict objectForKey:@"is_dub"];
            model.image_all = [comicDict objectForKey:@"image_all"];
            model.server_time = [comicDict objectForKey:@"server_time"];
            
            [topArray addObject:model];
//        }
        
        //列表
        for (NSMutableDictionary * listDcit in [strDataStr objectForKey:@"chapter_list"]) {
            HTLComicsDetaiDetailModel * listModel = [[HTLComicsDetaiDetailModel alloc]init];
            /**
             name
             image_total;
             chapter_id;
             size;
             pass_time;
             release_time;
             type;
             price;
             is_view;
             buyed;
             read_state;
             */
            listModel.name = [listDcit objectForKey:@"name"];
            listModel.image_total = [listDcit objectForKey:@"image_total"];
            listModel.chapter_id = [listDcit objectForKey:@"chapter_id"];
            listModel.mySize = [listDcit objectForKey:@"size"];
            listModel.pass_time = [listDcit objectForKey:@"pass_time"];
            listModel.release_time = [listDcit objectForKey:@"release_time"];
            listModel.type = [listDcit objectForKey:@"type"];
            listModel.price = [listDcit objectForKey:@"price"];
            listModel.is_view = [listDcit objectForKey:@"is_view"];
            listModel.buyed = [listDcit objectForKey:@"buyed"];
            listModel.read_state = [listDcit objectForKey:@"read_state"];
            [listArray addObject:listModel];
        }
        
        [mytableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed");
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView协议
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 295.0f;
    }else{
        return 30.0f;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return listArray.count+topArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTLComicsDetaiDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HTLComicsDetaiDetailTableViewCell"];
    
    if (cell == nil) {
        cell = [[HTLComicsDetaiDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HTLComicsDetaiDetailTableViewCell"];
    }
    
    if (indexPath.row == 0) {
        HTLComicsDetaiDetailModel * model = [topArray objectAtIndex:0];
    
        /**
         *cover;
         *name;
         *author_name;
         *last_update_time
         *click_total;
         *collect;
         *read;
         *mydescription;
         *cate_id;
         *theme_ids;
         */
        [cell.cover sd_setImageWithURL:[NSURL URLWithString:model.cover]];
        cell.name.text = model.name;
        cell.author_name.text = model.author_name;
        cell.last_update_time.text = model.last_update_time;
        cell.click_total.text = model.click_total;
        [cell.collect addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        [cell.read addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        cell.mydescription.text = model.mydescription;
        cell.cate_id.text = model.cate_id;
        cell.theme_ids.text = model.theme_ids;
        return cell;
    }else{
    //其他
    UITableViewCell * myCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        HTLComicsDetaiDetailModel * model = [listArray objectAtIndex:indexPath.row-1];
        UILabel * labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 200, 20)];
        labelTitle.text = model.name;
        labelTitle.font = [UIFont boldSystemFontOfSize:17];
        labelTitle.textColor = [UIColor blackColor];
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(250, 2, 50, 20)];
        [button setBackgroundColor:[UIColor redColor]];
        if (indexPath.row %2 == 0) {
            myCell.backgroundColor = [UIColor whiteColor];
            
        }else{
            myCell.backgroundColor = [UIColor grayColor];
            
        }
        [myCell.contentView addSubview:labelTitle];
        [myCell.contentView addSubview:button];
    
        return myCell;
    }
}
@end
