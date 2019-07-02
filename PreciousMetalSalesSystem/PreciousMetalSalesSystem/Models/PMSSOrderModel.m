//
//  PMSSOrderModel.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSOrderModel.h"
#import "PMSSGoodsFactory.h"

@implementation PMSSOrderModel

-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.orderId = data[@"orderId"];
        self.memberId = data[@"memberId"];
        self.createTime = data[@"createTime"];
        
        PMSSGoodsFactory *goodsFactory = [[PMSSGoodsFactory alloc] init];
        
        NSArray *orderArray = data[@"items"];
        NSMutableArray *mGoodModelArray = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *orderDic in orderArray)
        {
            PMSSGoodsModel *good = [goodsFactory getModelFromID:orderDic[@"product"]];
            if (good) {
                [mGoodModelArray addObject:good];
            }
        }
        self.goodModelArray = mGoodModelArray;
    }
    return self;
}

@end
