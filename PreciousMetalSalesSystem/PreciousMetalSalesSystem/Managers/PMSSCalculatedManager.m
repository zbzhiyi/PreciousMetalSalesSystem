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
    NSMutableDictionary *goodModelGroupDic = [NSMutableDictionary dictionaryWithCapacity:0];
    for (PMSSGoodsModel *goodModel in orderModel.goodModelArray)
    {
        NSMutableArray *groupedGoodsArray = [goodModelGroupDic objectForKey:goodModel.goodId];
        if (!groupedGoodsArray) {
            groupedGoodsArray = [NSMutableArray arrayWithCapacity:0];
        }
        [groupedGoodsArray addObject:goodModel];
        [goodModelGroupDic setObject:groupedGoodsArray forKey:goodModel.goodId];
    }
    
    CGFloat orderPrice = 0;
    for (NSString *key in goodModelGroupDic.allKeys)
    {
        NSMutableArray *groupedGoodsArray = [goodModelGroupDic objectForKey:key];
        if (groupedGoodsArray.count > 0)
        {
            PMSSGoodsFactory *factory = [[PMSSGoodsFactory alloc] init];
            orderPrice = orderPrice + [factory getTotalPriceWithGoodModel:groupedGoodsArray[0] amount:groupedGoodsArray.count discountArray:orderModel.discountCards];
        }
    }
    return orderPrice;
}


@end
