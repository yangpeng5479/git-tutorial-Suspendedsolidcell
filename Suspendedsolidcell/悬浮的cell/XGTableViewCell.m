//
//  XGTableViewCell.m
//  悬浮的cell
//
//  Created by 小果 on 16/1/21.
//  Copyright © 2016年 小果. All rights reserved.
//

#import "XGTableViewCell.h"


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface XGTableViewCell ()
@property (nonatomic,strong)UIView *bgView;
@end

@implementation XGTableViewCell

// 重写cell的样式
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        // 设置cell的内容
        [self setupCellUI];
        
    }
    return self;
}

-(void)setupCellUI{
    // 创建一个UIView比self.contentView小一圈
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, ScreenW, 100)];
    
    self.bgView.layer.cornerRadius = 40;
//    self.bgView.layer.masksToBounds = YES;
    
    // 设置bgView的背景颜色
    self.bgView.backgroundColor = [UIColor greenColor];
//    // 给bgView设置阴影
    self.bgView.layer.shadowOffset = CGSizeMake(2,5);
    
//    self.bgView.layer.shadowOffset = CGSizeMake(0,0);
    // 设置阴影的透明度
    self.bgView.layer.shadowOpacity = 0.8;
//    // 设置阴影的颜色
    self.bgView.layer.shadowColor = [UIColor blueColor].CGColor;
    // 设置阴影的半径
    self.bgView.layer.shadowRadius = 10;
    [self.contentView addSubview:self.bgView];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 80, 80)];
    imageview.contentMode = UIViewContentModeScaleToFill;
    //加阴影
    //shadowColor阴影颜色
    imageview.layer.shadowColor = [UIColor redColor].CGColor;
    //shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    imageview.layer.shadowOffset = CGSizeMake(5,5);
    //阴影透明度，默认0
    imageview.layer.shadowOpacity = 1.0;
    //阴影半径，默认3
    imageview.layer.shadowRadius = 10;
    imageview.backgroundColor = [UIColor lightGrayColor];
    self.imageview = imageview;
    imageview.layer.borderColor = [UIColor yellowColor].CGColor;
    imageview.layer.borderWidth = 3;
    
    [self.bgView addSubview:imageview];
    
}

+ (CGFloat)getHeight{
    //在这里能计算高度，动态调整
    return 100;
}
@end
