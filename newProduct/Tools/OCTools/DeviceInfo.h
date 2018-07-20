//
//  DeviceInfo.h
//  ZyzDemo
//
//  Created by  on 15/8/4.
//  Copyright (c) 2015年 sendmetospace.co.uk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfo : NSObject

+ (NSString *)getUUID;
+(NSString *)getIDFA;
+ (NSString*)getIOSVersion;
//获取设备model的全名
+ (NSString*)getIOSModel;
+ (Boolean)isIphoneX;
+ (Boolean)isSimulator;
@end
