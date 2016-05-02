//
//  UITableViewCellViewController.m
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/2.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "UITableViewCellViewController.h"

@interface UITableViewCellViewController ()
@property (weak,nonatomic) IBOutlet UITableViewCell *news_cell;
@property (weak,nonatomic) IBOutlet UIImageView *head_image_cell;
@property (weak,nonatomic) IBOutlet UILabel *profile_label_cell;
@property (weak,nonatomic) IBOutlet UITextView *text_view_cell;
@end

@implementation UITableViewCellViewController


//cell 可重用性
+(instancetype)NewsCellCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"reuseCellId";
    UITableViewCellViewController *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"UITableViewCellViewController" owner:nil options:nil]lastObject];
    }
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
