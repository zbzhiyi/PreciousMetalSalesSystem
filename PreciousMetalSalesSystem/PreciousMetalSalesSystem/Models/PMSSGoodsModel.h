//
//  PMSSGoodsModel.h
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMSSDiscountModel.h"
typedef NS_ENUM(NSInteger, FullSubType) {
    FullSubTypeThree,     //满三千减350
    FullSubTypeTwo,       //  满两千减30
    FullSubTypeOne,      //满一千减10
    FullSubTypeSubHalf,      //第3件半价（买3件及以上，其中1件半价）
    FullSubTypeSubOne,      //满3送1（买4件及以上，其中1件免费）
    
};




NS_ASSUME_NONNULL_BEGIN

@interface PMSSGoodsModel : NSObject

/**
 商品名字
 */
@property (nonatomic, copy) NSString *goodName;

/**
 商品Id
 */
@property (nonatomic, copy) NSString *goodId;

/**
 商品价格
 */
@property (nonatomic, assign) CGFloat goodPrice;

/**
 商品单位
 */
@property (nonatomic, copy) NSString *goodUnit;

/**
 商品数量
 */
@property (nonatomic, assign) NSInteger amount;


/**
 商品满减优惠集合
 FullSubTypeThree,     //满三千减350
 FullSubTypeTwo,       //  满两千减30
 FullSubTypeOne,      //满一千减10
 FullSubTypeSubHalf,      //第3件半价（买3件及以上，其中1件半价）
 FullSubTypeSubOne,      //满3送1（买4件及以上，其中1件免费）
 */
@property (nonatomic, strong)NSArray *fullSubArray;


/**
 商品打折券使用规则
 DiscountTypeNone,     //默认为不可用
 DiscountType9,        //可用9折券
 DiscountType95,       // 可用95折券
 */
@property (nonatomic, strong)PMSSDiscountModel *disModel;

-(NSString *)getGoodPrintInfo;
@end

NS_ASSUME_NONNULL_END
