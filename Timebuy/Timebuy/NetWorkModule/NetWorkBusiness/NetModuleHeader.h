//
//  NetModuleHeader.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#ifndef NetModuleHeader_h
#define NetModuleHeader_h
//#import "Reachability.h"
#import "TBHttpService.h"
#import "TBHttpRequest.h"
#import "TBHttpResponse.h"
#import "TBHttpError.h"
@protocol TBNetWorkDelegate <NSObject>
@required
-(void)tbRequestDidFail:(TBHttpError *) error;
@optional
-(void)tbRequestSuccessWithDic:(NSMutableDictionary *)response;

-(void)tbRequestSuccessWithArray:(NSMutableArray *)response;

-(void)tbRequestSuccessWithDic:(NSMutableDictionary *)response service:(NSString *)identifier;

-(void)tbRequestSuccessWithArray:(NSMutableArray *)response service:(NSString *)identifier;

@end
static NSString *const JYCServerDomainError = @"TBServerErrorDomain";
static NSString *const JYCSystemErrorDomain = @"TBSystemErrorDomain";
#endif /* NetModuleHeader_h */
