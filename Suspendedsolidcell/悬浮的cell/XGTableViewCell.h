//
//  XGTableViewCell.h
//  悬浮的cell
//
//  Created by 小果 on 16/1/21.
//  Copyright © 2016年 小果. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XGTableViewCell : UITableViewCell
+ (CGFloat)getHeight;
@property (nonatomic, weak) UIImageView *imageview;
@end
