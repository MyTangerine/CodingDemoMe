//
//  MainNewsViewController.m
//  CodingDemoMe
//
//  Created by 橘子 on 16/4/25.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "MainNewsViewController.h"
#import "UITableViewCellViewController.h"
#define NAVRect self.navigationController.navigationBar.frame
CGFloat const writeButtonWidth = 33;
CGFloat const writeButtonHeight = 32;
@interface MainNewsViewController ()<UITableViewDataSource>
@end

@implementation MainNewsViewController

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


-(void)tableViewShow{
    
    NSLog(@"%@",NSStringFromCGRect(self.tabBarController.tabBar.frame));
    UITableView *news_table_view = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 375, 618-64)style:UITableViewStylePlain];
    
    
    news_table_view.dataSource = self;
    news_table_view.delegate = self;
    
    
    [self.view addSubview:news_table_view];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCellViewController *cell = [[UITableViewCellViewController alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

    
    return cell;
}

@end
