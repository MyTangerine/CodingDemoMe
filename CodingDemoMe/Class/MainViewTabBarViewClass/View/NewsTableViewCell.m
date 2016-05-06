//
//  UITableViewCellViewController.m
//  CodingDemoMe
//
//  Created by 橘子 on 16/5/2.
//  Copyright © 2016年 wolf. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image_view_cell;
@property (weak, nonatomic) IBOutlet UILabel *title_from_cell;
@property (weak,nonatomic) IBOutlet UILabel *profile_label_cell;
@property (weak,nonatomic) IBOutlet UILabel *text_view_cell;
@end

@implementation NewsTableViewCell
//-(instancetype)init{
//    if (self = [super init]){
//    UIBezierPath *head_path = [[UIBezierPath alloc]init];
//    [head_path addArcWithCenter:CGPointMake(33, 33) radius:33 startAngle:0 endAngle:2*M_PI clockwise:YES];
//    CAShapeLayer *head_layer = [CAShapeLayer layer];
//    head_layer.path  = head_path.CGPath;
//    self.head_image_cell.layer.mask = head_layer;
//    }
//    return self;
//}


+(instancetype)newsTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"reuseCellId";
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}


-(void)setModelClass:(NewsModelClass *)modelClass{
    _modelClass = modelClass;
    self.image_view_cell.image = [UIImage imageNamed:modelClass.icon];
    self.profile_label_cell.text = modelClass.desc;
    self.title_from_cell.text = modelClass.title_from;
    self.text_view_cell.text = modelClass.title;
    
    
    
    
    CGRect image_view_bounds = self.image_view_cell.bounds;
    CGFloat x_path = image_view_bounds.origin.x + (image_view_bounds.size.width/2);
    CGFloat y_path = image_view_bounds.origin.y+(image_view_bounds.size.height/2);
    UIBezierPath *head_path = [[UIBezierPath alloc]init];
        [head_path addArcWithCenter:CGPointMake(x_path, y_path) radius:15 startAngle:0 endAngle:2*M_PI clockwise:YES];
        CAShapeLayer *head_layer = [CAShapeLayer layer];
        head_layer.path  = head_path.CGPath;
        self.image_view_cell.layer.mask = head_layer;

}


@end
