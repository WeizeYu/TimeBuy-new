//
//  TimebuyTests.m
//  TimebuyTests
//
//  Created by CraftDream on 15/9/21.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TBNetLoginBusi.h"
#import "UserModel.h"
@interface TimebuyTests : XCTestCase<TBNetLoginBusiDelegate>
@property (nonatomic) TBNetLoginBusi *service;

@end

@implementation TimebuyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.service = [[TBNetLoginBusi alloc]initWithDelegate:self  username:@"13758240890"password:@"1"];
    [self.service start];

//[[NSRunLoop currentRunLoop] runUntilDate:[NSDate distantFuture]];
// Put setup code here. This method is called before the invocation of each test method in the class.
}

-(void)loginSuccess:(UserModel *)user{
    //NSLog(@"%@",[user description]);
    NSLog(@"suc");
}
-(void)loginFail:(NSError *)error{
    NSLog(@"fail%@",error);
}
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
