//
//  YJAddChannelHeadSetionView.m
//  频道管理视图
//
//  Created by yj on 16/6/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJAddChannelHeadSetionView.h"

@implementation YJAddChannelHeadSetionView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        CGFloat margin = 15;
        UILabel *label = [[UILabel alloc] init];
        self.titleLabel = label;
        label.frame = CGRectMake(margin, 0, [UIScreen mainScreen].bounds.size.width - 2*margin, frame.size.height);
        [self addSubview:label];
    
        
        
    }
    return self;
}

@end
