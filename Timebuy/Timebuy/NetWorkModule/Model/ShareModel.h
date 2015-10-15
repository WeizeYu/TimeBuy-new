//
//  ShareModel.h
//  Timebuy
//
//  Created by yuweize on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareModel : NSObject
@property(nonatomic) NSString *shareId;         //分享id
@property(nonatomic) NSString *shareTime;       //分享时间
@property(nonatomic) NSString *shareContent;    //分享内容
@property(nonatomic) NSString *shareNewsId;     //分享消息主键
@property(nonatomic) NSString *shareUserId;     //分享用户主键
-(id)initWithprojectId:(NSString *)projectId;
-(id)initWithSelfinfo:(NSDictionary *)result;
@end
