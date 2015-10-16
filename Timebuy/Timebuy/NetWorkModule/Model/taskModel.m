//
//  taskModel.m
//  Timebuy
//
//  Created by yuweize on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "taskModel.h"

@implementation taskModel

-(id)initWithNewsId:(NSString *)taskNewsId
{
    self = [super init];
    if (self) {
        self.taskNewsId = taskNewsId;
    }
    return self;
}

-(id)initWithtaskNews:(NSString *)taskNews
            taskPhone:(NSString *)taskPhone
              taskPic:(NSString *)taskPic
              taskTag:(NSString *)taskTag
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id)initWithSelfinfo:(NSDictionary *)result
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
