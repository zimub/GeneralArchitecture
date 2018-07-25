//
//  YJChannelCell.h
//  频道管理视图
//
//  Created by yj on 16/6/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJChannelCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *channelNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (assign,nonatomic) BOOL isEidtable;  //是否可以编辑


/**
 *  删除按钮的block
 */
@property (copy,nonatomic) void(^deleteBlock) (YJChannelCell* channelCell, UIButton*deleteBtn);

- (void)setDeleteBlock:(void (^)(YJChannelCell *channelCell, UIButton *deleteBtn))deleteBlock;

@end
