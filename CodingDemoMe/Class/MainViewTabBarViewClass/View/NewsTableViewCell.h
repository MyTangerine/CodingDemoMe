//
//  UITableViewCellViewController.h
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/2.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModelClass.h"
@interface NewsTableViewCell : UITableViewCell
@property (strong,nonatomic) NewsModelClass * modelClass;
+(instancetype)newsTableViewCellWithTableView:(UITableView *)tableView;

@end
