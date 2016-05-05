//
//  NewsModelClass.h
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/2.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModelClass : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *title_from;
@property (nonatomic,copy) NSString *desc;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)NewsModelClassWithDic:(NSDictionary *)dic;
+(NSArray *)NewsModelClassList;
@end
