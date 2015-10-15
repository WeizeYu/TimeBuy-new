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
@property(nonatomic,assign)int  age;
@property(nonatomic,copy)NSString *profession;
@property(nonatomic,copy)NSString *hometown;

@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *signature;


@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,strong)NSDate *birthDay;
@end


//_leftAry = [NSArray arrayWithObjects:@"姓名",@"性别",@"年龄",@"职业",@"故乡",@"账号",@"个性签名", nil];
