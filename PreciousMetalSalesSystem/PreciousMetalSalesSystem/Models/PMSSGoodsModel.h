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
    
};

typedef NS_ENUM(NSInteger, DiscountType) {
    DiscountType9,        //满三千减350
    DiscountType95,       //  满两千减30
    
    
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
