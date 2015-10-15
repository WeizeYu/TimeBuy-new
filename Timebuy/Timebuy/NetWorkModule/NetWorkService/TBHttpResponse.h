//
//  TBHttpResponse.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBHttpResponse : NSURLResponse
@property (strong,nonatomic) NSData *responseData;
@property (strong,nonatomic) NSError *responseError;

- (id) initHttpResponseWithData : (NSData *)responseData andError:(NSError *)error;

@end
