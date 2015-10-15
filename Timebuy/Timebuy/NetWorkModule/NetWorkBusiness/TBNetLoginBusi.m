//
//  TBNetLoginBusi.m
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "TBNetLoginBusi.h"
#import "NetModuleHeader.h"
@interface TBNetLoginBusi()<TBHttpServiceDelegate>

@end
@implementation TBNetLoginBusi
-(void)start{
    [self.currentService startRequest];
}

-(void)cancel{
    [self.currentService cancelRequest];
}

-(id) initWithDelegate:(id<TBNetLoginBusiDelegate>) delegate username:(NSString *)username password:(NSString *)password{
    self = [super init];
    if (self) {
        if(username==nil && password ==nil)
        {
            username=@"13758240890";
            password=@"1";
        }
        NSString *interfaceName = @"reg/phone";
        NSString *paramsString =[NSString stringWithFormat:@"phone=%@&source=%@&clientVersion=1&did=1&loginTime=2010/10/10 10:10:10&clientType=10",username,password];
        NSString *urlString = [NSString stringWithFormat:@"%@%@?%@",timebuyUrl,interfaceName,paramsString];
        NSLog(@"url=%@",urlString);
        urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        TBHttpRequest *request  = [[TBHttpRequest alloc] initHttpRequestWithURL:urlString andMethod:TimebuySerSend andBodyData:nil];
        
        _currentService = [[TBHttpService alloc] initWithNormalRequest:request startImediately:YES];
        _currentService.delegate = self;
        self.delegate = delegate;
    }
    return self;
}

#pragma mark -------------------- TBHttpServiceDelegate ----------------------------------
-(void)requestDidFinish:(NSMutableData *)responseData{
    NSMutableDictionary *rootInfor =[[NSMutableDictionary alloc] initWithDictionary:[NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil]];
    NSLog(@"rootinfo=%@",rootInfor);
    NSString *token=[rootInfor objectForKey:@"msg"];
    NSLog(@"中文=%@",token);
    //NSLog(@"code=%@",code);
//    if ([code isEqualToString:@"1000"]) {
//        
//        if ([self.delegate respondsToSelector:@selector(loginSuccess:)]) {
//            NSDictionary *result=[rootInfor objectForKey:@"result"];
//            NSString *userid=[result objectForKey:@"user_id"];
//            NSString *token=[result objectForKey:@"access_token"];
//            UserModel *one =[[UserModel alloc]initWithLogin:userid  token:token];
//            [self.delegate loginSuccess:one];
//        }
//    }else{
//        if ([code isEqualToString:@"-1"]) {
//            [self.delegate loginFail:[NSError errorWithDomain:JYCServerDomainError code:-1 userInfo:nil]];
//        }
//        else{
//            [self.delegate loginFail:[NSError errorWithDomain:JYCServerDomainError code:9087 userInfo:nil]];
//        }
//    }
}

-(void)requestFailWithError:(TBHttpError *)error{
    
    if ([self.delegate respondsToSelector:@selector(loginFail:)]) {
        [self.delegate loginFail:[NSError errorWithDomain:JYCSystemErrorDomain code:error.errorCode userInfo:nil]];
    }
}

@end
