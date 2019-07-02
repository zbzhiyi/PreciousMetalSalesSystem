//
//  PMSSCustomerFactory.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSCustomerFactory.h"
#import "PMSSCustomerModel.h"

@implementation PMSSCustomerFactory
+ (PMSSCustomerFactory *)sharedInstance
{
    static PMSSCustomerFactory * customerFactory = nil;
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        customerFactory = [[PMSSCustomerFactory alloc] init];
    });
    return customerFactory;
}

- (void)buildCustomerData
{
    NSMutableDictionary *mCustomerDic = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray *customerDataArray = @[@{@"Name":@"马丁",@"LevelName":@"普卡",@"MemberId":@"6236609999",@"Points":@"9860"},@{@"Name":@"王立",@"LevelName":@"金卡",@"MemberId":@"6630009999",@"Points":@"48860"},@{@"Name":@"李想",@"LevelName":@"白金卡",@"MemberId":@"8230009999",@"Points":@"98860"},@{@"Name":@"张三",@"LevelName":@"钻石卡",@"MemberId":@"9230009999",@"Points":@"198860"}];
    for (NSDictionary *itemData in customerDataArray)
    {
        NSString *memberId = itemData[@"MemberId"];
        PMSSCustomerModel *customerModel = [[PMSSCustomerModel alloc] initWithData:itemData];
        [mCustomerDic setObject:customerModel forKey:memberId];
    }
    self.customerDic = mCustomerDic;
}


@end
