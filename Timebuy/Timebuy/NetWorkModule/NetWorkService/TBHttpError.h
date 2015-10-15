//
//  TBHttpError.h
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum{
    TBSUCCESS = 0,
    TBNONETWORK = -1001,
    TBNETWORKBREAK = -1002,
    TBNETWORKNORESPONSE = -1003,
    TBConnectionFailNoNet = -1004,
    TBUNDKNOWERROR = -1005
}TBNetServiceErrorCode;

@interface TBHttpError : NSObject

@property (nonatomic) TBNetServiceErrorCode errorCode;

@property (strong,nonatomic) NSString *errorDescription;

-(id) initWithErrorCode:(TBNetServiceErrorCode) errorCode andDescription : (NSString *)description;
@end
