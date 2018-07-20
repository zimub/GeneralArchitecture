//
//  DeviceInfo.m
//  ZyzDemo
//
//  Created by  on 15/8/4.
//  Copyright (c) 2015年 sendmetospace.co.uk. All rights reserved.
//

#import "DeviceInfo.h"
#import <AdSupport/AdSupport.h>//IDFA
#import <UIKit/UIKit.h>
#import "DefineKeyChain.h"
//网络状态

//ip
#include <ifaddrs.h>
#include <arpa/inet.h>

//系统全名
#import <sys/utsname.h>



@implementation DeviceInfo

/*
     func saveuuid() {
     let uuidStr = UIDevice.current.identifierForVendor?.uuidString
     guard let uuid = uuidStr else {
     return
     }
     let saveInfomation = NSMutableDictionary()
     if let uudic = DefineKeyChain.load("uuidDic") {
     let uudic1 = uudic as! NSMutableDictionary
     let Str:String = uudic1["uuidstr"]as? String ?? ""
     if Str.lengthOfBytes(using: .utf8)>0 {
     //                Bugly.setUserIdentifier("uuid:\(Str)")
     return
     }else{
     saveInfomation.setObject(uuid, forKey: "uuidstr" as NSCopying)
     }
     }
     DefineKeyChain.save("uuidDic", data: saveInfomation)
     }
 */
+ (NSString *)getUUID{
    NSDictionary * uudic = [DefineKeyChain load:@"uuidDic"];
    if (uudic == nil || ![uudic.allKeys containsObject:@"uuidstr"]) {
        NSString * value = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        NSMutableDictionary *maDic = [[NSMutableDictionary alloc] init];
        [maDic setObject:value forKey:@"uuidstr"];
        [DefineKeyChain save:@"uuidDic" data:maDic];
        NSLog(@"uuid:%@",value);
        return value;
    }else {
        NSLog(@"uuid:%@",uudic[@"uuidstr"]);
        return uudic[@"uuidstr"];
    }
}
//获取IDFA
+(NSString *)getIDFA{
    NSString *value;
    float systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVer >= 6) {
        value =  [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];;
    }
    else
    {
        CFUUIDRef cfuuid = CFUUIDCreate(kCFAllocatorDefault);
        value = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, cfuuid));

    }
    return value;
}
//获取系统版本号
+ (NSString*)getIOSVersion
{
    return  [NSString stringWithFormat:@"%lf",[[[UIDevice currentDevice] systemVersion]floatValue]];
    
}
//获取设备model的全名
+ (NSString*)getIOSModel
{
//    return @"iPhone X";
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
    
}
+ (Boolean)isIphoneX {
//    return YES;
    return [[DeviceInfo getIOSModel] isEqualToString:@"iPhone X"] || [[DeviceInfo getIOSModel] isEqualToString:@"iPhone Simulator"];
}

+ (Boolean)isSimulator {
    //    return YES;
    return [[DeviceInfo getIOSModel] isEqualToString:@"iPhone Simulator"];
}
@end
