//
//  WelfareModel.h
//  Timebuy
//
//  Created by yuweize on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WelfareModel : NSObject
@property(nonatomic) NSString *projectId;         //公益id
@property(nonatomic) NSString *WelfareSummary;    //公益简介
@property(nonatomic) NSString *WelfareDetail;     //公益详情
@property(nonatomic) NSString *WelfareSource;     //公益来自
@property(nonatomic) NSString *WelfareTarget;     //公益目标金额
@property(nonatomic) NSString *WelfareAlready;    //已筹款额度
@property(nonatomic) NSString *WelfarePeople;     //捐款人数
@property(nonatomic) NSString *WelfarePic;        //图片名称
@property(nonatomic) NSString *WelfareTeamId;     //所属团队主键
@property(nonatomic) NSString *WelfaretotalTime;  //项目总时间（小时）
-(id)initWithprojectId:(NSString *)projectId;
-(id)initWithSelfinfo:(NSDictionary *)result;
@end
