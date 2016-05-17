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
#import <CoreData/CoreData.h>
#import "News+CoreDataProperties.h"
#define NAVRect self.navigationController.navigationBar.frame
CGFloat const writeButtonWidth = 33;
CGFloat const writeButtonHeight = 32;
@interface MainNewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak,nonatomic)NSArray *newsModelClass;
@property (nonatomic,strong)NSManagedObjectContext *context;

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
    [self setUpContext];
    [self getNewsJsonData];
    
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


#pragma -mark UITableView 控制

-(void)tableViewShow{
    
    
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

#pragma -mark 返回cell行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.newsModelClass.count;
}

#pragma -mark 创建一个数据库的上下文
-(void)setUpContext{
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *dataUrl = [NSURL fileURLWithPath:[path stringByAppendingPathComponent:@"CodingDemoMe.sqlite"]];
    NSLog(@"%@",dataUrl);
    NSError *error = nil;
    [psc addPersistentStoreWithType:NSSQLiteStoreType
                      configuration:nil
                                URL:dataUrl
                            options:nil
                              error:&error];
    [context setPersistentStoreCoordinator:psc];
    self.context = context;
}


#pragma -mark 创建了一个获取json方法
-(void)getNewsJsonData{

    
    int num = 1;
    
    NSString *str = [[NSString alloc]initWithFormat:@"http://119.29.58.43/api/getSfBlog/getPage=%d",num];
    NSURL *url = [[NSURL alloc]initWithString:str];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:1 timeoutInterval:15.0f];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *dicArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
}





-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NewsTableViewCell *cell = [NewsTableViewCell newsTableViewCellWithTableView:tableView];
    //从字典里面获取相应的索引值
    NewsModelClass *reuseCellId = self.newsModelClass[indexPath.row];
    //获取到的值赋给cell的model
    cell.modelClass = reuseCellId;
    return cell;
}

@end
