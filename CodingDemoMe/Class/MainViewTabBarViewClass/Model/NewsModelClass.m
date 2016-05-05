//
//  NewsModelClass.m
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/2.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "NewsModelClass.h"

@implementation NewsModelClass
-(instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self =[super init]){
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}
+(instancetype)NewsModelClassWithDic:(NSDictionary *)dic{
   return [[self alloc]initWithDic:dic];
}

+(NSArray *)NewsModelClassList{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"News" ofType:@"plist"];
    NSArray *news_array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *news_m_array = [NSMutableArray array];
    
    for (NSDictionary *dic in news_array) {
        NewsModelClass *nmc = [NewsModelClass NewsModelClassWithDic:dic];
        [news_m_array addObject:nmc];
    }
    return news_m_array;
}
@end
