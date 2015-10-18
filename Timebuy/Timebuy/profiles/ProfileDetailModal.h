//
//  ProfileDetailModal.h
//  Timebuy
//
//  Created by He yang on 15/10/11.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileDetailModal : NSObject
@property(nonatomic,copy)NSString *nickName;
@property(copy,nonatomic)NSString *sex;
@property(nonatomic,assign)NSInteger  age;
@property(nonatomic,copy)NSString *profession;
@property(nonatomic,copy)NSString *hometown;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *signature;

@property(nonatomic,strong)NSString *headIcon;//头像
@property(nonatomic,copy)NSString *address;//地址
@property(nonatomic,copy)NSString *userName;//用户名
@property(nonatomic,copy)NSString *userId;//用户id
@property(nonatomic,strong)NSDate *birthDay;//生日

@end


//依次@"姓名",@"性别",@"年龄",@"职业",@"故乡",@"账号",@"个性签名", nil];
