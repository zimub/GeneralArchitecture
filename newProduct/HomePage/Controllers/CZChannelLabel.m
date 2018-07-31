//
//  CZChannelLabel.m
//  网易新闻
//
//  Created by apple on 16/1/20.
//  Copyright © 2016年 apple. All rights reserved.
//


#define kBIG 16
#define kSMALL 14
#import "CZChannelLabel.h"

@implementation CZChannelLabel

+(instancetype)labelWithTname:(NSString *)tname{
    CZChannelLabel *label = [[CZChannelLabel alloc] init];
    label.text = tname;
    //设置大字体,确定label的空间大小
    label.font = [UIFont systemFontOfSize:kBIG];
    [label sizeToFit];
    label.font = [UIFont systemFontOfSize:kSMALL];

    return label;
}

 //给label进行赋值,改变lable中文字的大小和颜色
-(void)setScale:(float)scale{
    _scale = scale;
    
    //变化系数
    float max = 0.2;
    //改变文字的大小
    self.transform = CGAffineTransformMakeScale(1+scale*max, 1+scale*max);
    //文字的颜色
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
}
@end
