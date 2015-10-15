//
//  TBNetLoginBusi.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetModuleHeader.h"
@class UserModel;

@protocol TBNetLoginBusiDelegate <NSObject>
-(void)loginSuccess:(UserModel *)user;
-(void)loginFail:(NSError *)error;
@end

@interface TBNetLoginBusi : NSObject

@property (weak,nonatomic) id<TBNetLoginBusiDelegate> delegate;

@property (readonly,strong,nonatomic) TBHttpService *currentService;

@property (strong,nonatomic) NSString *requestIdentifier;//use for identify an request

-(id) initWithDelegate:(id<TBNetLoginBusiDelegate>) delegate username:(NSString *)username password:(NSString *)password;

-(void)start;

-(void)cancel;
@end
