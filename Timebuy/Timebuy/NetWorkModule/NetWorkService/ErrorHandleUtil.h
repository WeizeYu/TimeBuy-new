//
//  ErrorHandleUtil.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorHandleUtil : NSObject
+(BOOL)handleError:(NSError *)error;
+(BOOL)handleErrorWithOutAlertBefor:(NSError *)error;

@end
