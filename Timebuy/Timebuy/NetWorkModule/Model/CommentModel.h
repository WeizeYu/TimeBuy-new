//
//  CommentModel.h
//  Timebuy
//
//  Created by yuweize on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property(nonatomic) NSString *commentId;        //评论id
@property(nonatomic) NSString *commentUserId;    //被评论用户id
@property(nonatomic) NSString *commentDoId;      //评论id
@property(nonatomic) NSString *commentNewsId;    //消息id
@property(nonatomic) NSString *commentTime;      //评论时间
@property(nonatomic) NSString *commentSpeed;     //速度（为1-5个分数）
@property(nonatomic) NSString *commentService;   //服务质量（为1-5个分数）
@property(nonatomic) NSString *commentKind;      //评论类型（0发布方评论响应方，1相反）
-(id)initWithcommentId:(NSString *)commentId;
-(id)initWithCommentUserId:(NSString *)commentUserId
               commentDoId:(NSString *)commentDoId
               commentTime:(NSString *)commentTime
               commentKind:(NSString *)commentKind;
-(id)initWithSelfinfo:(NSDictionary *)result;
@end
