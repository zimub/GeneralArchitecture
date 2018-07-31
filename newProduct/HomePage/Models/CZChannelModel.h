//
//  CZChannelModel.h
//  网易新闻
//
//  Created by apple on 16/1/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

//频道
@interface CZChannelModel : NSObject

@property(nonatomic,copy) NSString *tname;
@property(nonatomic,copy) NSString *tid;

//article/list/T1348648517839/0-20.html
//当前频道的url
@property(nonatomic,copy) NSString *currentUrl;

//kvc
+(instancetype)modelWithDictionary:(NSDictionary *)dic;
//得到所有的频道模型
+(NSArray *)channelList;

@end
