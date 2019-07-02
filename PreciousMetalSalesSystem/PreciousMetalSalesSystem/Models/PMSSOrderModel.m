//
//  PMSSOrderModel.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSOrderModel.h"

@implementation PMSSOrderModel

-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.orderId = data[@"orderId"];
        self.memberId = data[@"memberId"];
        self.createTime = data[@"createTime"];
        
        NSArray *orderArray = data[@"items"];
        NSMutableArray *mGoodModelArray = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *orderDic in orderArray) {
            PMSSGoodsModel *good = [[PMSSGoodsModel alloc] init];
            [mGoodModelArray addObject:good];
        }
        self.goodModelArray = mGoodModelArray;
    }
    return self;
}

@end
