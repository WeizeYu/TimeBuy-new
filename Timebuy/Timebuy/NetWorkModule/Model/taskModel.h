//
//  taskModel.h
//  Timebuy
//
//  Created by yuweize on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface taskModel : NSObject
@property(nonatomic) NSString *taskNewsId;     //任务id
@property(nonatomic) NSString *taskNews;       //任务内容
@property(nonatomic) NSString *taskStarttime;  //任务开始时间
@property(nonatomic) NSString *taskFinishtime; //任务完成时间
@property(nonatomic) NSString *taskPhone;      //手机号
@property(nonatomic) NSString *taskMoney;      //金额
@property(nonatomic) NSString *taskCoordname;  //任务坐标名称
@property(nonatomic) NSString *taskCoordx;     //任务坐标x
@property(nonatomic) NSString *taskCoordy;     //任务坐标y
@property(nonatomic) NSString *taskPic;        //任务图片，多张图片逗号隔开
@property(nonatomic) NSString *taskUserid;     //用户主键
@property(nonatomic) NSString *taskAcceptUserid;//接受消息用户主键
@property(nonatomic) NSString *taskLabel;      //标签种类（1跑腿，2陪我，3学霸，4公益）
@property(nonatomic) NSString *taskPraise;     //任务点赞数
@property(nonatomic) NSString *taskShare;      //任务分享数
@property(nonatomic) NSString *taskTag;        //任务标记（0等待中，1进行中，2已完成，3申诉中，4已取消，5延时中）
@property(nonatomic) NSString *taskDate;       //任务接受时间
-(id)initWithNewsId:(NSString *)taskNewsId;
-(id)initWithtaskNews:(NSString *)taskNews
            taskPhone:(NSString *)taskPhone
              taskPic:(NSString *)taskPic
              taskTag:(NSString *)taskTag;
-(id)initWithSelfinfo:(NSDictionary *)result;
@end
