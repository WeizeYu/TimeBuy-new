//
//  UserModel.m
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
-(id) initWithLogin:(NSString *)userId token:(NSString *)to
{
    self = [super init];
    if (self) {
        self.userId=userId;
        self.userToken=to;
    }
    return self;
}
-(id)initWithSelfinfo:(NSDictionary *)result
{
    self=[super self];
    if(self){
        self.userId=[result objectForKey:@"userId"];
        self.userPhone=[result objectForKey:@"phone"];
        self.userToken=[result objectForKey:@"userToken"];
        self.userName=[result objectForKey:@"userName"];
        self.userHeadIcon=[result objectForKey:@"headIcon"];
    }
    return self;
}
-(id)initWithUserId:(NSString *)userId{
    self = [super init];
    if (self) {
        self.userId = userId;
    }
    return self;
}
-(id)initWithuserPhone:(NSString *)phone
              userName:(NSString *)userName
          userHeadIcon:(NSString *)userHeadIcon
               userSex:(NSString *)userSex
        userProfession:(NSString *)userProfession;
{
    self=[super init];
    if(self)
    {
        self.userPhone=phone;
        self.userName=userName;
        self.userHeadIcon=userHeadIcon;
        self.userSex=userSex;
        self.userProfession=userProfession;
    }
    return self;
}
@end
