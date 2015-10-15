//
//  TBHttpRequest.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBHttpRequest : NSMutableURLRequest
- (id) initHttpRequestWithURL : (NSString *)url andMethod:(NSString *)method andBodyData:(NSData *)bodyData;
- (id) initHttpRequestFormWithURL : (NSString *)url andMethod:(NSString *)method andBodyParams:(NSDictionary *)params;
@end
