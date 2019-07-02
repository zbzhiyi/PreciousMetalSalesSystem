//
//  PMSSGoodsModel.h
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, FullSubType) {
    FullSubTypeThree,     //满三千减350
    FullSubTypeTwo,       //  满两千减30
    FullSubTypeOne,      //满一千减10
    FullSubTypeSubHalf,      //第3件半价（买3件及以上，其中1件半价）
    FullSubTypeSubOne,      //满3送1（买4件及以上，其中1件免费）
    
};

typedef NS_ENUM(NSInteger, DiscountType) {
    DiscountTypeNone,     //默认为不可用
    DiscountType9,        //可用9折券
    DiscountType95,       // 可用95折券
    
    
};


NS_ASSUME_NONNULL_BEGIN

@interface PMSSGoodsModel : NSObject

@property (nonatomic, copy) NSString *goodName;

@property (nonatomic, copy) NSString *goodId;

@property (nonatomic, copy) NSString *goodPrice;

@property (nonatomic, copy) NSString *goodUnit;

@property (nonatomic, strong)NSArray *fullSubArray;

@property (nonatomic, assign)DiscountType disType;



@end

NS_ASSUME_NONNULL_END
