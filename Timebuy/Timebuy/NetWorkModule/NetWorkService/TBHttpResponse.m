//
//  TBHttpResponse.m
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "TBHttpResponse.h"

@implementation TBHttpResponse
- (id) initHttpResponseWithData : (NSData *)responseData andError:(NSError *)error{
    self = [super init];
    if(self){
        self.responseData = responseData;
        self.responseError = error;
    }
    return self;
}
@end
