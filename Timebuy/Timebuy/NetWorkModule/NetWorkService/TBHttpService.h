//
//  TBHttpService.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HttpSeperator @"AaB03x"
#define HttpSeperatorLine @"--AaB03x"
#define HttpSeperatorEnd @"--AaB03x--"

@class TBHttpError;
@class TBHttpRequest;
@class TBHttpResponse;
@protocol TBHttpServiceDelegate <NSObject>
@optional

//-(void)requestGetResponse:()

@required
-(void)requestDidFinish:(NSMutableData *)responseData;

-(void)requestFailWithError:(TBHttpError *)error;

@end
@interface TBHttpService : NSObject
@property (strong,nonatomic) NSURLConnection *currentConnect;

@property (weak,nonatomic) id<TBHttpServiceDelegate>delegate;

@property (strong,nonatomic) NSMutableData *responseData;

-(id)initWithNormalRequest:(TBHttpRequest *)request startImediately:(BOOL) startImediately;

-(id)initWithFormRequest:(TBHttpRequest *)request startImediately:(BOOL) startImediately;

-(void)startRequest;

-(void)cancelRequest;
@end
