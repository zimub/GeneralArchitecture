//
//  YJChannelCell.m
//  频道管理视图
//
//  Created by yj on 16/6/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJChannelCell.h"

@implementation YJChannelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _channelNameLabel.layer.borderColor =  [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1.0].CGColor;
    _channelNameLabel.layer.borderWidth = 1;
    _channelNameLabel.layer.cornerRadius = 17;
    _channelNameLabel.layer.masksToBounds = YES;
    _channelNameLabel.font = [UIFont systemFontOfSize:15];
    _channelNameLabel.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    _channelNameLabel.text = @"鲜闻";
    
    //默认删除按钮是隐藏的
    _deleteButton.hidden = YES;
    
    

    
    
    
}


- (void)setIsEidtable:(BOOL)isEidtable {

    _isEidtable = isEidtable;
    
    if (isEidtable) {
        
        [self startShakeAnimation];
    }
    else {
    
        [self stopShakeAnimation];
    }
}



#pragma mark - 删除按钮点击事件
- (IBAction)deleteButtonAction:(UIButton *)sender {
    
    if (self.deleteBlock) {
        self.deleteBlock(self,sender);
    }
}

- (void)startShakeAnimation {
    
    _deleteButton.hidden = NO;
    //创建
    
    CAKeyframeAnimation *shakeKey = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    CGFloat up = M_PI*0.02;
    CGFloat down = - M_PI*0.02;
    CGFloat center = 0.0;
    
    shakeKey.duration = 0.15;
    shakeKey.repeatCount = MAXFLOAT;
    shakeKey.fillMode = kCAFillModeForwards;
    shakeKey.values = @[@(up),@(center),@(down)];
    

    [_channelNameLabel.layer addAnimation:shakeKey forKey:@"shake"];
    
}

- (void)stopShakeAnimation {

    
    _deleteButton.hidden = YES;
    
    [_channelNameLabel.layer removeAnimationForKey:@"shake"];
}

@end
