//
//  DefineKeyChain.h
//  KeyChain
//
//  Created by ju on 16/10/10.
//  Copyright © 2016年 ju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
@interface DefineKeyChain : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

@end
