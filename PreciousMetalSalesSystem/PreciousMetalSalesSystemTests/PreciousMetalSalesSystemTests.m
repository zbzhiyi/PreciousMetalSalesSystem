//
//  PreciousMetalSalesSystemTests.m
//  PreciousMetalSalesSystemTests
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PMSSCustomerFactory.h"
#import "PMSSCustomerModel.h"
#import "PMSSGoodsFactory.h"
#import "PMSSGoodsModel.h"
#import "PMSSOrderModel.h"
#import "PMSSCalculatedManager.h"
@interface PreciousMetalSalesSystemTests : XCTestCase

@end

@implementation PreciousMetalSalesSystemTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

/**
 根据用户id 来获取用户信息
 */
- (void)testUserWithMemberid
{
    NSString *memberid = @"6236609999";
    [[PMSSCustomerFactory sharedInstance] buildCustomerData];
    PMSSCustomerModel *model = [[PMSSCustomerFactory sharedInstance] getCustomerByMemberId:memberid];
    XCTAssertNotEqual(model.name, @"马丁");
    
    
}

/**
 根据商品id 来获取商品信息
 */
- (void)testGoodWithGoodId
{
    NSString *goodId = @"001001";
    PMSSGoodsFactory *factory = [[PMSSGoodsFactory alloc] init];
    PMSSGoodsModel *model = [factory getModelFromID:goodId];
    XCTAssertTrue(model.goodPrice == 998);
}
- (void)testCalculatePrice
{
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"simple_command" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:strPath];
    NSDictionary *templateServiceData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    PMSSOrderModel *orderModel = [[PMSSOrderModel alloc] initWithData:templateServiceData];
    CGFloat price = [PMSSCalculatedManager calculatedPriceByOrder:orderModel];
    XCTAssertTrue(price == 9860);

}
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
