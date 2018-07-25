//
//  YJButton.h
//  注册登录模块UI
//
//  Created by yj on 16/3/30.
//  Copyright © 2016年 yj. All rights reserved.
//  支持block的按钮

#import <UIKit/UIKit.h>
@class YJButton;
typedef void(^actionHandler)(YJButton*button);

@interface YJButton : UIButton

@property (copy,nonatomic) actionHandler handler;

@property (assign,nonatomic) BOOL yj_selected;
// 添加点击事件
- (void)yj_addHandler:(actionHandler)handler;

@end
