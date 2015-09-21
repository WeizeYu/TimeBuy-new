//
//  userConfiguration.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/24.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define      Launched                       @"Launched"
#define      Authenticated                     @"Authenticated"

@interface userConfiguration : NSObject

+(void)setApplicationStartupDefaults;

+(BOOL)getBoolValueForConfigurationKey:(NSString *)_objectkey;

+(NSString *)getStringValueForConfigurationKey:(NSString *)_objectkey;

+(NSData *)getObjectValueForConfigurationKey:(NSString *)_objectkey;

+(void)setBoolValueForConfigurationKey:(NSString *)_objectkey withValue:(BOOL)_boolvalue;

+(void)setStringValueForConfigurationKey:(NSString *)_objectkey withValue:(NSString *)_value;

+(void)setDataValueForConfigurationKey:(NSString *)_objectkey withValue:(NSData *)_value;

@end
