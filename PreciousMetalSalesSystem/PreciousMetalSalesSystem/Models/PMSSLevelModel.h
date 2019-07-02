//
//  PMSSLevelModel.h
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    CustomerLevelOfOrdinaryCard, //普通卡
    CustomerLevelOfGoldCard,//金卡
    CustomerLevelOfPlatinumCard, //白金卡
    CustomerLevelOfDiamondCard //钻石卡
} CustomerLevelType;

@interface PMSSLevelModel : NSObject
/**
 用户等级：CustomerLevelOfOrdinaryCard:普通卡；CustomerLevelOfGoldCard：金卡
 CustomerLevelOfPlatinumCard：白金卡；CustomerLevelOfDiamondCard：钻石卡
 */
@property (nonatomic, assign) CustomerLevelType level;

/**
 用户等级名称：普通卡，金卡，白金卡，钻石卡
 */
@property (nonatomic, copy) NSString *levelName;

/**
 用户等级对应的积分换算率
 普卡：1倍基准积分，累计积分1万以下
 金卡：1.5倍基准积分，累计积分1万（含）-5万（不含）
 白金卡：1.8倍基准积分，累计积分5万（含）-10万（不含）
 钻石卡：2倍基准积分，累计积分10万以上
 */
@property (nonatomic, assign) CGFloat pointScale;

-(id)initWithLevel:(CustomerLevelType ) level;

@end

NS_ASSUME_NONNULL_END
