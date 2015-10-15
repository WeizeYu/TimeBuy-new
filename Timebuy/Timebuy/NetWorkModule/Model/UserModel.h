//
//  UserModel.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property(nonatomic) NSString *userId;        //用户id
@property(nonatomic) NSString *userToken;     //唯一标识
@property(nonatomic) NSString *userPhone;     //手机号
@property(nonatomic) NSString *userName;      //用户名
@property(nonatomic) NSString *userHeadIcon;  //头像url
@property(nonatomic) NSString *userNickName;  //用户昵称
@property(nonatomic) NSString *userSex;       //用户性别
@property(nonatomic) NSString *userProfession;//用户职业
@property(nonatomic) NSString *userAddress;   //地址
@property(nonatomic) NSString *userCreateTime;//创建时间
@property(nonatomic) NSString *userUpdateTime;//最近一次修改时间
@property(nonatomic) NSString *userBirthDay;  //生日
@property(nonatomic) NSString *userSignature; //个性签名
@property(nonatomic) NSString *userStatus;    //用户的状态
@property(nonatomic) NSString *userSourse;    //账号的注册来源
@property(nonatomic) NSString *userMoney;     //钱包
-(id)initWithUserId:(NSString *)userId;
-(id)initWithLogin:(NSString *) userId
             token:(NSString *) token;
-(id)initWithuserPhone:(NSString *)phone
              userName:(NSString *)userName
          userHeadIcon:(NSString *)userHeadIcon
               userSex:(NSString *)userSex
        userProfession:(NSString *)userProfession;
-(id)initWithSelfinfo:(NSDictionary *)result;
@end
