//
//  PMSSGoodsModel.m
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "PMSSGoodsModel.h"
#import "PMSSGoodsFactory.h"

@implementation PMSSGoodsModel

-(NSString *)getGoodPrintInfo
{
    NSString *printString = [NSString stringWithFormat:@"(%@)%@X%ld, %0.2f, %0.2f",self.goodId,self.goodName,(long)self.amount,self.goodPrice,self.goodPrice*self.amount];
    return printString;
}


@end
