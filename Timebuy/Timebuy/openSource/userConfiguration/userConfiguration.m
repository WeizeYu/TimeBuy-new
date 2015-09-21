//
//  userConfiguration.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/24.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "userConfiguration.h"


@implementation userConfiguration

+(void)setApplicationStartupDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setBool:YES forKey:Launched];
    [defaults setBool:YES forKey:Authenticated];
    [defaults synchronize];
}

+(BOOL)getBoolValueForConfigurationKey:(NSString *)_objectkey
{
    //create an instance of NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    return [defaults boolForKey:_objectkey];
}

+(NSString *)getStringValueForConfigurationKey:(NSString *)_objectkey
{
    //create an instance of NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    if ([defaults stringForKey:_objectkey] == nil )
    {
        //I don't want a (null) returned since the result might be a text property of a UILabel
        return @"";
    }
    else
    {
        
        return [defaults stringForKey:_objectkey];
    }
}

+(NSData *)getObjectValueForConfigurationKey:(NSString *)_objectkey
{
    //create an instance of NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    if ([defaults objectForKey:_objectkey] == nil )
    {
        //I don't want a (null) returned since the result might be a text property of a UILabel
        return nil;
    }
    else
    {
        
        return [defaults objectForKey:_objectkey];
    }
}

+(void)setBoolValueForConfigurationKey:(NSString *)_objectkey withValue:(BOOL)_boolvalue
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    [defaults setBool:_boolvalue forKey:_objectkey];
    [defaults synchronize];//make sure you're synchronized again
}

+(void)setStringValueForConfigurationKey:(NSString *)_objectkey withValue:(NSString *)_value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    
    if (![_objectkey isKindOfClass:[NSNull class]]) {
        [defaults setValue:_value forKey:_objectkey];
        [defaults synchronize];//make sure you're synchronized again
    }
    
}

+(void)setDataValueForConfigurationKey:(NSString *)_objectkey withValue:(NSData *)_value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    [defaults setObject:_value forKey:_objectkey];
    [defaults synchronize];//make sure you're synchronized again
}

@end
