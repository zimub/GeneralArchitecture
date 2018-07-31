//
//  CZChannelModel.m
//  网易新闻
//
//  Created by apple on 16/1/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CZChannelModel.h"

@implementation CZChannelModel

+(instancetype)modelWithDictionary:(NSDictionary *)dic{
    CZChannelModel *model = [CZChannelModel new];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

+(NSArray *)channelList{
    NSMutableArray *mArray = [NSMutableArray array];
    
    //从本地读取
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    //二进制数据
    NSData *data =[NSData dataWithContentsOfFile:filePath];
    //json反序列化
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *array = dic[@"tList"];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CZChannelModel *model = [CZChannelModel modelWithDictionary:obj];
        [mArray addObject:model];
    }];
    
    
    //排序 sort 在block中需要返回比较的结果
    [mArray sortUsingComparator:^NSComparisonResult(CZChannelModel *  _Nonnull obj1, CZChannelModel *  _Nonnull obj2) {
        //得到字符信息ascii码,用ascii进行比较
       return [obj1.tid compare:obj2.tid];
    }];
    
    return mArray.copy;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ {tname =%@ tid = %@}",[super description],self.tname,self.tid];
}

-(NSString *)currentUrl{
//article/list/T1348648517839/0-20.html
    return [NSString stringWithFormat:@"article/list/%@/0-20.html",_tid];
}
@end
