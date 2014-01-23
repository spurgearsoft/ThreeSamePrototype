//
//  ThreeSamePrototypeTests.m
//  ThreeSamePrototypeTests
//
//  Created by 흰둥이 on 2014. 1. 22..
//  Copyright (c) 2014년 SpurGearSoft. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ThreeSamePrototypeTests : XCTestCase

@end

@implementation ThreeSamePrototypeTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    for (int i=0; i<50; i++) {
        NSLog(@"----------random:[%d]%d",i, (int)random()%6);
    }
    
}

@end
