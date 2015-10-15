//
//  TeamModel.h
//  Timebuy
//
//  Created by yuweize on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamModel : NSObject
@property(nonatomic) NSString *teamId;              //团队id
@property(nonatomic) NSString *teamSummary;         //团队简介
@property(nonatomic) NSString *teamExperience;      //团队经历
@property(nonatomic) NSString *teamMember;          //成员介绍
@property(nonatomic) NSString *teamSource;          //团队来源
@property(nonatomic) NSString *teamTotalFunds;      //一共募集款项
@property(nonatomic) NSString *teamTotalProject;    //一共发布项目数
@property(nonatomic) NSString *teamTotalTime;       //一共募集时间（小时）
@property(nonatomic) NSString *teamAlreadyFunds;    //已经募集款项
-(id)initWithprojectId:(NSString *)projectId;
-(id)initWithSelfinfo:(NSDictionary *)result;
@end
