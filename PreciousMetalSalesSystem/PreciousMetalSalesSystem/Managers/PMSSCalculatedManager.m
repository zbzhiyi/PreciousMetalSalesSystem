//
//  PMSSCalculatedManager.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSCalculatedManager.h"
#import "PMSSCustomerFactory.h"

@implementation PMSSCalculatedManager

+(CGFloat)calculatedByOrder:(PMSSOrderModel *) orderModel
{
    PMSSCustomerModel *customerModel = [PMSSCustomerFactory sharedInstance];
    return 0;
}


@end
