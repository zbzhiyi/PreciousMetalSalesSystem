//
//  PMSSGoodsFactory.m
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "PMSSGoodsFactory.h"

@implementation PMSSGoodsFactory
+ (PMSSGoodsFactory *)sharedInstance
{
    static PMSSGoodsFactory * customerFactory = nil;
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        customerFactory = [[PMSSGoodsFactory alloc] init];
    });
    return customerFactory;
}

- (instancetype)init
{
    self = [super init]; // call the designated initializer
    if (self) {
        [self stepGoodsData];
    }
    return self;
}

/**
 商品录入
 */
- (void)stepGoodsData
{
    //世园会五十国钱币册
    PMSSGoodsModel *model = [[PMSSGoodsModel alloc] init];
    model.goodName = @"世园会五十国钱币册";
    model.goodId = @"001001";
    model.goodUnit = @"册";
    model.goodPrice = 998;
    [self.goodsDictionary setObject:model forKey:model.goodId];
    
    //2019北京世园会纪念银章大全
    PMSSGoodsModel *model1 = [[PMSSGoodsModel alloc] init];
    model1.goodName = @"2019北京世园会纪念银章大全40g";
    model1.goodId = @"001002";
    model1.goodUnit = @"盒";
    model1.goodPrice = 1380;
    model1.disModel = [[PMSSDiscountModel alloc] init];
    model1.disModel.discoutName =@"9折券";
    model1.disModel.discoutNum = 0.9;
    model1.disModel.discoutType = DiscountType9;
    [self.goodsDictionary setObject:model1 forKey:model1.goodId];
    
    //招财进宝
    PMSSGoodsModel *model2 = [[PMSSGoodsModel alloc] init];
    model2.goodName = @"招财进宝";
    model2.goodId = @"003001";
    model2.goodUnit = @"条";
    model2.goodPrice = 1580;
    model2.disModel = [[PMSSDiscountModel alloc] init];
    model2.disModel.discoutName =@"95折券";
    model2.disModel.discoutNum = 0.95;
    model2.disModel.discoutType = DiscountType95;
    [self.goodsDictionary setObject:model2 forKey:model2.goodId];
    
    //水晶之恋
    PMSSGoodsModel *model3 = [[PMSSGoodsModel alloc] init];
    model3.goodName = @"水晶之恋";
    model3.goodId = @"003002";
    model3.goodUnit = @"条";
    model3.goodPrice = 980;
    model3.fullSubArray = @[@(FullSubTypeSubHalf),@(FullSubTypeSubOne)];
    [self.goodsDictionary setObject:model3 forKey:model3.goodId];
    
    //中国经典钱币套装
    PMSSGoodsModel *model4 = [[PMSSGoodsModel alloc] init];
    model4.goodName = @"中国经典钱币套装";
    model4.goodId = @"002002";
    model4.goodUnit = @"套";
    model4.goodPrice = 998;
    model4.fullSubArray = @[@(FullSubTypeTwo),@(FullSubTypeOne)];
    [self.goodsDictionary setObject:model4 forKey:model4.goodId];
    
    
    //守扩之羽比翼双飞4.8g
    PMSSGoodsModel *model5 = [[PMSSGoodsModel alloc] init];
    model5.goodName = @"守扩之羽比翼双飞4.8g";
    model5.goodId = @"002001";
    model5.goodUnit = @"条";
    model5.goodPrice = 1080;
    model5.fullSubArray = @[@(FullSubTypeSubHalf),@(FullSubTypeSubOne)];
    model5.disModel = [[PMSSDiscountModel alloc] init];
    model5.disModel.discoutName =@"95折券";
    model5.disModel.discoutNum = 0.95;
    model5.disModel.discoutType = DiscountType95;
    [self.goodsDictionary setObject:model5 forKey:model5.goodId];
    
    //国银象棋12g
    PMSSGoodsModel *model6 = [[PMSSGoodsModel alloc] init];
    model6.goodName = @"中国银象棋12g";
    model6.goodId = @"002003";
    model6.goodUnit = @"套";
    model6.goodPrice = 698;
    model6.fullSubArray = @[@(FullSubTypeOne),@(FullSubTypeTwo),@(FullSubTypeThree)];
    model6.disModel = [[PMSSDiscountModel alloc] init];
    model6.disModel.discoutName =@"9折券";
    model6.disModel.discoutNum = 0.9;
    model6.disModel.discoutType = DiscountType9;
    [self.goodsDictionary setObject:model6 forKey:model6.goodId];
}

- (PMSSGoodsModel *)getModelFromID:(NSString *)goodsId
{
    return [self.goodsDictionary objectForKey:goodsId];
}

- (CGFloat)getTotalPriceWithGoodModel:(PMSSGoodsModel *)goodModel amount:(NSUInteger)amount discountArray:(NSArray *)array
{
    CGFloat originTotalPrice  = goodModel.goodPrice * amount;
    
    CGFloat discountPrice = 0.0f;
    
    if (array.count == 0 || !goodModel.disModel)
    {
        discountPrice = originTotalPrice;
    }else
    {
        for (PMSSDiscountModel *model in array) {
            
            if (model.discoutType == goodModel.disModel.discoutType)
            {
                discountPrice = originTotalPrice * model.discoutNum;
            }
        }
    }
    
    CGFloat fullSubPrice = originTotalPrice;
    if (goodModel.fullSubArray.count == 0)
    {
        fullSubPrice = originTotalPrice;
    } else
    {
        for (NSNumber *typeFlag in goodModel.fullSubArray)
        {
            CGFloat fullSubPriceForType = [self getTotalPriceWithGoodModel:goodModel amount:amount fullSubType:[typeFlag integerValue]];
            if (fullSubPriceForType < fullSubPrice) {
                fullSubPrice = fullSubPriceForType;
            }
        }
    }
    
    if (!self.discountInfoArray) {
        self.discountInfoArray = [NSMutableArray arrayWithCapacity:0];
    }
    if (discountPrice<fullSubPrice && discountPrice != originTotalPrice)
    {
        if (![self.discountInfoArray containsObject:goodModel.disModel.discoutName]) {
            [self.discountInfoArray addObject:goodModel.disModel.discoutName];
        }
    }
    return fullSubPrice<discountPrice?fullSubPrice:discountPrice;
}

- (CGFloat)getTotalPriceWithGoodModel:(PMSSGoodsModel *)goodModel amount:(NSUInteger)amount fullSubType:(FullSubType)fullSubType
{
    CGFloat totalPrice = goodModel.goodPrice*amount;

    switch (fullSubType) {
        case FullSubTypeOne:
            {
                totalPrice = totalPrice - ((int)(totalPrice/1000))*10;
            }
            break;
        case FullSubTypeTwo:
        {
            totalPrice = totalPrice - ((int)(totalPrice/2000))*30;
        }
            break;
        case FullSubTypeThree:
        {
            totalPrice = totalPrice - ((int)(totalPrice/3000))*350;
        }
            break;
        case FullSubTypeSubHalf:
        {
            if (amount >= 3) {
                totalPrice = totalPrice - goodModel.goodPrice/2.0;
            }
        }
            break;
        case FullSubTypeSubOne:
        {
            if (amount >= 4) {
                totalPrice = totalPrice - goodModel.goodPrice;
            }
        }
            break;
        default:
            break;
    }
    return totalPrice;
}

- (NSMutableDictionary *)goodsDictionary
{
    if (!_goodsDictionary) {
        _goodsDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _goodsDictionary;
}




@end
