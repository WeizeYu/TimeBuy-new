//
//  ErrorHandleUtil.m
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "ErrorHandleUtil.h"
#import "SVProgressHUD.h"
#import "NetModuleHeader.h"

@implementation ErrorHandleUtil
//+(BOOL)handleError:(NSError *)error{
//    if ([error.domain isEqualToString:JYCSystemErrorDomain]) {
//        if (error.code == -1001 || error.code == -1004) {
//            [SVProgressHUD dismissWithError:@"网络故障，请检查您的网络设置" afterDelay:AlertTime];
//        }else{
//            if (error.code == -1002) {
//                [SVProgressHUD dismissWithError:@"网络连接中断，请连接网络重试" afterDelay:AlertTime];
//            }else{
//                [SVProgressHUD dismissWithError:@"服务器繁忙，请稍后重试" afterDelay:AlertTime];
//            }
//        }
//        return NO;
//    }else{
//        return YES;
//    }
//}
//
//+(BOOL)handleErrorWithOutAlertBefor:(NSError *)error{
//    if ([error.domain isEqualToString:JYCSystemErrorDomain]) {
//        if (error.code == -1001 || error.code == -1004 || error.code == -1005) {
//            [SVProgressHUD show];
//            [SVProgressHUD dismissWithError:@"网络故障，请检查您的网络设置" afterDelay:AlertTime];
//        }else{
//            if (error.code == -1002) {
//                [SVProgressHUD show];
//                [SVProgressHUD dismissWithError:@"网络连接中断，请连接网络重试" afterDelay:AlertTime];
//            }else{
//                [SVProgressHUD show];
//                [SVProgressHUD dismissWithError:@"服务器繁忙，请稍后重试" afterDelay:AlertTime];
//            }
//        }
//        return NO;
//    }else{
//        return YES;
//    }
//}
@end
