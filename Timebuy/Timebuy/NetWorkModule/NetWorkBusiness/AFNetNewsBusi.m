//
//  AFNetNewsBusi.m
//  Timebuy
//
//  Created by Mr.OJ on 15/10/16.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "AFNetNewsBusi.h"
@interface AFNetNewsBusi() <AFNetNewsBusiDelegate>

@end

@implementation AFNetNewsBusi


-(id) initWithtimeNow:(NSString *)timeNow coordx:(NSString *)coordx coordy:(NSString *)coordy currentPage:(NSString *)currentPage
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}


- (void)go
{
    NSDate *curDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *curDateTime = [formatter stringFromDate:curDate];
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    
    //2.设置登录参数
    NSDictionary *dict = @{ //@"usrId":[userConfiguration getStringValueForConfigurationKey:@"userId"],
                           @"timeNow":curDateTime,
                           @"coordx":@"1",
                           @"coordy":@"1",
                           @"currentPage":@"1",
                           //@"did":[[[UIDevice currentDevice] identifierForVendor] UUIDString],   //获得设备标志
                           };
    NSString *url = [NSString stringWithFormat:@"%@%@",timebuyUrl,@"news/online"];
    
    //3.请求
    
    [manager GET:url parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            
            [self.delegate newsSuccess:responseObject];
            
            //[SVProgressHUD show];
            //[SVProgressHUD dismissWithSuccess:@"加载成功" afterDelay:1.0];
            
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2003"]) {
            //[self showErrorWithTitle:@"首页加载失败" WithMessage:@"用户名不存在"];
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2004"]) {
            //[self showErrorWithTitle:@"首页加载失败" WithMessage:@"密码错误"];
        } else {
            //[self showErrorWithTitle:@"首页加载失败" WithMessage:@"系统错误"];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        //[HUD hide:YES];
        //[self showErrorWithTitle:@"首页加载失败" WithMessage:@"网络连接失败，请检查网络设置"];
    }];
}


- (void)newsSuccess:(id)user
{
    NSLog(@"Hello！");
}

- (void)newsFail:(NSError *)error
{
    
}


@end
