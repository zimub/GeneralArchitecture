//
//  CZChannelLabel.h
//  网易新闻
//
//  Created by apple on 16/1/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义label,显示频道
@interface CZChannelLabel : UILabel
//创建label
+(instancetype)labelWithTname:(NSString *)tname;

//变化率
@property(nonatomic,assign) float scale;

@end
