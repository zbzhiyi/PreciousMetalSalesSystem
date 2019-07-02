//
//  PMSSGoodsFactory.m
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "PMSSGoodsFactory.h"

@implementation PMSSGoodsFactory


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
    model.goodPrice = @"998";
    [self.goodsDictionary setObject:model forKey:model.goodId];
    
    //2019北京世园会纪念银章大全
    PMSSGoodsModel *model1 = [[PMSSGoodsModel alloc] init];
    model1.goodName = @"2019北京世园会纪念银章大全40g";
    model1.goodId = @"001002";
    model1.goodUnit = @"盒";
    model1.goodPrice = @"1380";
    model1.disType = DiscountType9;
    [self.goodsDictionary setObject:model1 forKey:model.goodId];
    
    //招财进宝
    PMSSGoodsModel *model2 = [[PMSSGoodsModel alloc] init];
    model2.goodName = @"招财进宝";
    model2.goodId = @"003001";
    model2.goodUnit = @"条";
    model2.goodPrice = @"1580";
    model2.disType = DiscountType95;
    [self.goodsDictionary setObject:model2 forKey:model.goodId];
    
    //水晶之恋
    PMSSGoodsModel *model3 = [[PMSSGoodsModel alloc] init];
    model3.goodName = @"水晶之恋";
    model3.goodId = @"003002";
    model3.goodUnit = @"条";
    model3.goodPrice = @"980";
    model3.fullSubArray = @[@(FullSubTypeSubHalf),@(FullSubTypeSubOne)];
    [self.goodsDictionary setObject:model3 forKey:model.goodId];
    
    //中国经典钱币套装
    PMSSGoodsModel *model4 = [[PMSSGoodsModel alloc] init];
    model3.goodName = @"中国经典钱币套装";
    model3.goodId = @"002002";
    model3.goodUnit = @"套";
    model3.goodPrice = @"998";
    model3.fullSubArray = @[@(FullSubTypeTwo),@(FullSubTypeOne)];
    [self.goodsDictionary setObject:model4 forKey:model.goodId];
    
    
    //守扩之羽比翼双飞4.8g
    PMSSGoodsModel *model5 = [[PMSSGoodsModel alloc] init];
    model5.goodName = @"守扩之羽比翼双飞4.8g";
    model5.goodId = @"002001";
    model5.goodUnit = @"条";
    model5.goodPrice = @"1080";
    model5.fullSubArray = @[@(FullSubTypeSubHalf),@(FullSubTypeSubOne)];
    model5.disType = DiscountType95;
    [self.goodsDictionary setObject:model5 forKey:model.goodId];
    
    //国银象棋12g
    PMSSGoodsModel *model6 = [[PMSSGoodsModel alloc] init];
    model6.goodName = @"银象棋12g";
    model6.goodId = @"002003";
    model6.goodUnit = @"套";
    model6.goodPrice = @"698";
    model6.fullSubArray = @[@(FullSubTypeOne),@(FullSubTypeTwo),@(FullSubTypeThree)];
    model6.disType = DiscountType9;
    [self.goodsDictionary setObject:model6 forKey:model.goodId];
    
    
    
    
    
    
}

- (PMSSGoodsModel *)getModelFromID:(NSString *)goodsId
{
    
    return [self.goodsDictionary objectForKey:goodsId];
    
}

- (NSMutableDictionary *)goodsDictionary
{
    if (!_goodsDictionary) {
        _goodsDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _goodsDictionary;
}




@end
