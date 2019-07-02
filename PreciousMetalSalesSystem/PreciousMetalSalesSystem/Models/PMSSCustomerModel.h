//
//  PMSSCustomerModel.h
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    CustomerLevelOfOrdinaryCard, //普通卡
    CustomerLevelOfGoldCard,//金卡
    CustomerLevelOfPlatinumCard, //白金卡
    CustomerLevelOfDiamondCard //钻石卡
} CustomerLevel;

@interface PMSSCustomerModel : NSObject

/**
 用户名
 */
@property (nonatomic, copy) NSString *name;


/**
 用户等级：CustomerLevelOfOrdinaryCard:普通卡；CustomerLevelOfGoldCard：金卡
 CustomerLevelOfPlatinumCard：白金卡；CustomerLevelOfDiamondCard：钻石卡
 */
@property (nonatomic, assign) CustomerLevel *level;

/**
 用户会员号
 */
@property (nonatomic, copy) NSString *memberId;

/**
 账户余额
 */
@property (nonatomic, copy) NSString *amount;

@end

NS_ASSUME_NONNULL_END
