//
//  YJChannelManagerView.h
//  频道管理视图
//
//  Created by yj on 16/6/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

@interface YJChannelManagerView : UIView

/**
 *  显示频道block必须实现
 */
@property (copy,nonatomic) NSMutableArray*(^showChannelsDataSource)();


/**
 *  隐藏频道的block必须实现
 */
@property (copy,nonatomic) NSMutableArray*(^hideChannelDataSource)();

/**
 *  选中频道的block
 */
@property (copy,nonatomic) void(^selectChannelBlock)(NSUInteger index);

- (void)setSelectChannelBlock:(void (^)(NSUInteger index))selectChannelBlock;

/**
 *  添加频道的block
 */
@property (copy,nonatomic) void(^addChannelBlock)(NSUInteger index);

- (void)setAddChannelBlock:(void (^)(NSUInteger index))addChannelBlock;


/**
 *  删除频道的Block
 */
@property (copy,nonatomic) void(^deleChannelBlock)(NSUInteger index);

- (void)setDeleChannelBlock:(void (^)(NSUInteger index))deleChannelBlock;


/**
 *  交换频道的block
 */
@property (copy,nonatomic) void(^exchangeChannelBlock)(NSUInteger startIndex,NSUInteger moveIndex);

- (void)setExchangeChannelBlock:(void (^)(NSUInteger startIndex, NSUInteger moveIndex))exchangeChannelBlock;


/**
 *  显示
 */
- (void)yj_show;
/**
 *  隐藏
 */
- (void)yj_hide;

@end
