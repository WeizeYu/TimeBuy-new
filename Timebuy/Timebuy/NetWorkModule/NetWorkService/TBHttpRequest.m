//
//  TBHttpRequest.m
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "TBHttpRequest.h"
#import "TBHttpService.h"
#import <Foundation/NSURLRequest.h>

#define HttpTimeOut 10.0
@implementation TBHttpRequest
- (id) initHttpRequestWithURL : (NSString *)url andMethod:(NSString *)method andBodyData:(NSData *)bodyData{
    self = [super init];
    if(self){
        //init code
        [self setURL:[NSURL URLWithString:url]];
        [self setHTTPMethod:method];
        /*
         self.cachePolicy
         */
        [self setHTTPBody:bodyData];
        self.timeoutInterval = HttpTimeOut;
    }
    return self;
}

- (id) initHttpRequestFormWithURL : (NSString *)url andMethod:(NSString *)method andBodyParams:(NSDictionary *)params{
    self = [super init];
    if(self){
        //init code
        self.timeoutInterval = HttpTimeOut;
        [self setURL:[NSURL URLWithString:url]];
        [self setHTTPMethod:method];
        NSMutableString *body=[[NSMutableString alloc]init];
        NSArray *allKeys= [params allKeys];
        for(NSString *one in allKeys)
        {
            [body appendFormat:@"%@\r\n",HttpSeperatorLine];
            [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",one];
            [body appendFormat:@"%@\r\n",[params objectForKey:one]];
        }
        [body appendFormat:@"%@\r\n",HttpSeperatorLine];
        NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",HttpSeperatorEnd];
        NSMutableData *myRequestData=[NSMutableData data];
        [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
        [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
        [self setHTTPBody:myRequestData];
    }
    return self;
}

@end
