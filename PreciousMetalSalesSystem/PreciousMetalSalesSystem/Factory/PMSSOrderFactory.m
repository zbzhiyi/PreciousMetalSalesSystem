//
//  PMSSOrderFactory.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSOrderFactory.h"

@implementation PMSSOrderFactory
+ (PMSSOrderFactory *)sharedInstance
{
    static PMSSOrderFactory * customerFactory = nil;
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        customerFactory = [[PMSSOrderFactory alloc] init];
    });
    return customerFactory;
}

-(PMSSOrderModel *) buildOrderModelWithData:(NSDictionary *) data
{
    PMSSOrderModel *orderModel = [[PMSSOrderModel alloc] initWithData:data];
    return orderModel;
}
@end
