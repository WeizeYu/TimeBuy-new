//
//  TBHttpService.m
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "TBHttpService.h"
#import "TBHttpResponse.h"
#import "TBHttpRequest.h"
#import "SVProgressHUD.h"
#import "TBHttpError.h"
//#import "Reachability.h"
@interface TBHttpService ()<NSURLConnectionDelegate>

@end
@implementation TBHttpService
-(id)initWithNormalRequest:(TBHttpRequest *)request startImediately:(BOOL) startImediately{
    self = [super init];
    if (self) {
        self.currentConnect = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:startImediately];
    }
    return self;
}
-(id)initWithFormRequest:(TBHttpRequest *)netrequest startImediately:(BOOL) startImediately{
    self = [super init];
    
    if (self) {
        self.responseData = [[NSMutableData alloc] init];
        NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",HttpSeperator];
        [netrequest setValue:content forHTTPHeaderField:@"Content-Type"];
        [netrequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[netrequest.HTTPBody length]] forHTTPHeaderField:@"Content-Length"];
        self.currentConnect = [[NSURLConnection alloc] initWithRequest:netrequest delegate:self startImmediately:startImediately];
    }
    return self;
}

-(void)startRequest{
    [self.currentConnect start];
}
-(void)cancelRequest{
    [self.currentConnect cancel];
}
#pragma mark NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if ([self.delegate respondsToSelector:@selector(requestFailWithError:)]) {
        TBHttpError *httpError = [[TBHttpError alloc] initWithErrorCode:(int)error.code andDescription:[error description]];
        [self.delegate performSelector:@selector(requestFailWithError:) withObject:httpError];
    }
}

//for get response first
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if ([self.delegate respondsToSelector:@selector(requestDidFinish:)]) {
        [self.delegate performSelector:@selector(requestDidFinish:) withObject:self.responseData];
    }
}

@end
