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
#import "PMSSCalculatedManager.h"

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
        self.originTotalPrice = 0;
        for (NSDictionary *orderDic in orderArray)
        {
            PMSSGoodsModel *good = [goodsFactory getModelFromID:orderDic[@"product"]];
            good.amount = [orderDic[@"amount"] integerValue];
            if (good) {
                [mGoodModelArray addObject:good];
                self.originTotalPrice = self.originTotalPrice + good.goodPrice*good.amount;
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

-(NSString *)getDiscountPrintInfo:(PMSSGoodsModel *) goodMoled
{
    PMSSGoodsFactory *goodsFactory = [[PMSSGoodsFactory alloc] init];
    CGFloat discoutPrice = [goodsFactory getTotalPriceWithGoodModel:goodMoled amount:goodMoled.amount discountArray:self.discountCards];
    discoutPrice = discoutPrice - goodMoled.goodPrice*goodMoled.amount;
    if (discoutPrice < 0) {
        NSString *printString = [NSString stringWithFormat:@"(%@)%@:, %0.2f",goodMoled.goodId,goodMoled.goodName,discoutPrice];
        return printString;
    }
    return nil;
}

-(void)writeOrderInfoToFile
{
    NSMutableString *infoString = [NSMutableString stringWithString:@"商品及数量           单价         金额\n"];
    for (PMSSGoodsModel *model in self.goodModelArray) {
        [infoString appendString:[model getGoodPrintInfo]];
        [infoString appendString:@"\n"];
    }
    [infoString appendFormat:@"合计：%0.2f \n",self.originTotalPrice];
    
    NSLog(@"%@",infoString);
}

-(void)writeOrderDiscountInfoToFile
{
    NSMutableString *infoString = [NSMutableString stringWithString:@"优惠清单：\n"];
    for (PMSSGoodsModel *model in self.goodModelArray) {
        if ([self getDiscountPrintInfo:model]) {
            [infoString appendString:[self getDiscountPrintInfo:model]];
            [infoString appendString:@"\n"];
        }
    }
    [infoString appendFormat:@"优化合计：%0.2f \n",self.discountPrice];
    NSLog(@"%@",infoString);

}

-(void)writePaymentInfoToFile
{
    NSMutableString *infoString = [NSMutableString stringWithString:@"应收合计："];
    [infoString appendFormat:@"%0.2f \n",(self.originTotalPrice- self.discountPrice)];
    [infoString appendString:@"收款：\n"];
    [infoString appendFormat:@"余额支付%0.2f \n",(self.originTotalPrice- self.discountPrice)];

    NSLog(@"%@",infoString);

}

-(void)writePointsInfoToFile
{
    NSMutableString *infoString = [NSMutableString stringWithString:@"客户等级与积分："];
    [infoString appendFormat:@"新增积分:%ld\n",(long)self.points];
    
    if (self.isUpdateLevel) {
        [infoString appendFormat:@"恭喜您升级为%@ 客户！\n",self.customerModel.level.levelName];
    }
    
    NSLog(@"%@",infoString);
    
}

-(PMSSCustomerModel *)customerModel
{
    PMSSCustomerFactory *customerFactory = [PMSSCustomerFactory sharedInstance];
    _customerModel = [customerFactory getCustomerByMemberId:self.memberId];
    return _customerModel;
}


@end
