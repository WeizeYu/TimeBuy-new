//
//  ComplaintsModel.h
//  Timebuy
//
//  Created by yuweize on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComplaintsModel : NSObject
@property(nonatomic) NSString *appealId;        //申诉id
@property(nonatomic) NSString *appealTime;      //申诉时间
@property(nonatomic) NSString *appealContent;   //申诉内容
@property(nonatomic) NSString *appealNewsId;    //被申诉消息主键
-(id)initWithcomplainId:(NSString *)complainId;
-(id)initWithCommentUserId:(NSString *)commentUserId
               commentDoId:(NSString *)commentDoId
               commentTime:(NSString *)commentTime
               commentKind:(NSString *)commentKind;
-(id)initWithSelfinfo:(NSDictionary *)result;
@end