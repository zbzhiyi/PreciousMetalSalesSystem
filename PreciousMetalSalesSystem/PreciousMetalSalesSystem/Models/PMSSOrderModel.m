//
//  PMSSOrderModel.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSOrderModel.h"
#import "PMSSGoodsFactory.h"
#import "PMSSDiscountModel.h"

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
            good.amount = [orderDic[@"amount"] integerValue];
            if (good) {
                [mGoodModelArray addObject:good];
            }
        }
        self.goodModelArray = mGoodModelArray;

        NSMutableArray *discountCardsModelArray = [NSMutableArray arrayWithCapacity:0];
        NSArray *discountCardsArray = data[@"discountCards"];
        for (NSString *discountCardsName in discountCardsArray)
        {
            PMSSDiscountModel *model = [[PMSSDiscountModel alloc] initWithName:discountCardsName];
            [discountCardsModelArray addObject:model];
        }
        self.discountCards = discountCardsModelArray;
    }
    return self;
}

@end
