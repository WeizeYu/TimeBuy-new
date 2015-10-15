//
//  TBHttpError.m
//  Timebuy
//
//  Created by yuweize on 15/10/13.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "TBHttpError.h"

@implementation TBHttpError
-(id) initWithErrorCode:(TBNetServiceErrorCode) errorCode andDescription : (NSString *)description{
    self = [super init];
    if(self){
        //init code
        self.errorCode = errorCode;
        self.errorDescription = description;
    }
    return self;
}

-(NSString *)description{
    return self.errorDescription;
}
@end
