//
//  YJButton.m
//  注册登录模块UI
//
//  Created by yj on 16/3/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJButton.h"
@implementation YJButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)yj_addHandler:(actionHandler)handler {

    self.handler = handler;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(YJButton*)button {

    if (self.handler) {
        
        self.handler(button);
    }
}


- (void)setYj_selected:(BOOL)yj_selected {

    if (yj_selected) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:19];
    }
    else {
    
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
}



@end
