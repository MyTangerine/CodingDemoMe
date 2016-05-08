//
//  MainNewsViewController.m
//  CodingDemoMe
//
//  Created by 橘子 on 16/4/25.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "MainNewsViewController.h"
#import "NewsTableViewCell.h"
#import "NewsModelClass.h"
#import "MJRefresh.h"
#define NAVRect self.navigationController.navigationBar.frame
CGFloat const writeButtonWidth = 33;
CGFloat const writeButtonHeight = 32;
@interface MainNewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak,nonatomic)NSArray *newsModelClass;
@end

@implementation MainNewsViewController


-(NSArray *)newsModelClass{
    if (_newsModelClass == nil){
        _newsModelClass = [NewsModelClass NewsModelClassList];
    }
    return _newsModelClass;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";
    [self initNavigationButton];
    [self tableViewShow];
}




-(void)initNavigationButton{
    UIButton *test = [UIButton buttonWithType:UIButtonTypeCustom];
    test.frame = CGRectMake(0, 0, writeButtonWidth, writeButtonHeight);
    [test setBackgroundImage:[UIImage imageNamed:@"image_write"] forState:UIControlStateNormal];
    [test setBackgroundImage:[UIImage imageNamed:@"image_write_on"] forState:UIControlStateHighlighted];
    [test setBackgroundColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:test];
    self.navigationItem.rightBarButtonItem = item;
}


// uitableview 控制类方法

-(void)tableViewShow{
    
    NSLog(@"%@",NSStringFromCGRect(self.tabBarController.tabBar.frame));
    
    
    
    UITableView *news_table_view = [[UITableView alloc]initWithFrame:CGRectMake(0, -25, 375, 700)style:UITableViewStyleGrouped];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    news_table_view.dataSource = self;
    news_table_view.delegate = self;
    [self.view addSubview:news_table_view];
    news_table_view.rowHeight = 180;
    
    news_table_view.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    
    news_table_view.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(beginMJRefresh)];
    [news_table_view.mj_header beginRefreshing];
    
    
    
    news_table_view.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
    }];
    
    news_table_view.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(beginMJRefresh)];
//    news_table_view.separatorStyle =UITableViewCellSeparatorStyleNone;
}

-(void)beginMJRefresh{
    NSLog(@"开始刷新了");
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.newsModelClass.count;
}

//创建了一个获取json方法，应放入工具类


-(void)getNewsJsonData{
    int num = 1;
    NSString *str = [[NSString alloc]initWithFormat:@"http://119.29.58.43/api/getSfBlog/getPage=%d",num];
    NSURL *url = [[NSURL alloc]initWithString:str];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:1 timeoutInterval:15.0f];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *data_array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",[data_array[0] objectForKey:@"author"]);
    
}





-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NewsTableViewCell *cell = [NewsTableViewCell newsTableViewCellWithTableView:tableView];
    NewsModelClass *reuseCellId = self.newsModelClass[indexPath.row];
    cell.modelClass = reuseCellId;
    return cell;
}

@end
