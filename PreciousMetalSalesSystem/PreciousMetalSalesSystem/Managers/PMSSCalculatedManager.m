//
//  PMSSCalculatedManager.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSCalculatedManager.h"
#import "PMSSCustomerFactory.h"
#import "PMSSGoodsFactory.h"

@implementation PMSSCalculatedManager

+(CGFloat)calculatedPriceByOrder:(PMSSOrderModel *) orderModel
{
    CGFloat orderPrice = 0;

    for (PMSSGoodsModel *goodModel in orderModel.goodModelArray)
    {
        PMSSGoodsFactory *factory = [[PMSSGoodsFactory alloc] init];
        orderPrice = orderPrice + [factory getTotalPriceWithGoodModel:goodModel amount:goodModel.amount discountArray:orderModel.discountCards];
    }
    
    return orderPrice;
}


@end
