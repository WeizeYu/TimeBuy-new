//
//  AFNetNewsBusi.h
//  Timebuy
//
//  Created by Mr.OJ on 15/10/16.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "SVProgressHUD.h"

@class taskModel;

@protocol AFNetNewsBusiDelegate <NSObject>
- (void)newsSuccess:(id)user;
- (void)newsFail:(NSError *)error;
@end

@interface AFNetNewsBusi : NSObject

@property (weak, nonatomic) id <AFNetNewsBusiDelegate> delegate;

- (void)go;
-(id) initWithtimeNow:(NSString *)timeNow coordx:(NSString *)coordx coordy:(NSString *)coordy currentPage:(NSString *)currentPage;

@end
