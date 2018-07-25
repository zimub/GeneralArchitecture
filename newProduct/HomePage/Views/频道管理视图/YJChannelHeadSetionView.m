//
//  YJChannelHeadSetionView.m
//  频道管理视图
//
//  Created by yj on 16/6/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJChannelHeadSetionView.h"

@implementation YJChannelHeadSetionView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        CGFloat margin = 15;
        UILabel *label = [[UILabel alloc] init];
        self.titleLabel = label;
        label.frame = CGRectMake(margin, 0, [UIScreen mainScreen].bounds.size.width - 2*margin, frame.size.height);
        [self addSubview:label];
        
        YJButton *eidButton = [YJButton buttonWithType:UIButtonTypeCustom];
        
        eidButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 7.5, 50, 20);
        eidButton.layer.borderColor = [UIColor redColor].CGColor;
        eidButton.layer.borderWidth = 1.0;
        eidButton.layer.cornerRadius = 10;
        eidButton.layer.masksToBounds = YES;
        eidButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [eidButton setTitle:@"编辑" forState:UIControlStateNormal];
        [eidButton setTitle:@"完成" forState:UIControlStateSelected];
        [eidButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    

        self.eidtButton = eidButton;
        [self addSubview:eidButton];
        
        
        
    }
    return self;
}

@end
