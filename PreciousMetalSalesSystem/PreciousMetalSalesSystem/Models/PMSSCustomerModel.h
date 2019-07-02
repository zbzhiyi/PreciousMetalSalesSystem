//
//  PMSSCustomerModel.h
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMSSLevelModel.h"
NS_ASSUME_NONNULL_BEGIN



@interface PMSSCustomerModel : NSObject

/**
 用户名
 */
@property (nonatomic, copy) NSString *name;

/**
 用户会员号
 */
@property (nonatomic, copy) NSString *memberId;

/**
 账户余额
 */
@property (nonatomic, assign) CGFloat amount;

/**
 用户积分
 */
@property (nonatomic, assign) NSInteger points;

/**
 用户等级
 */
@property (nonatomic, strong) PMSSLevelModel *level;

-(id)initWithData:(NSDictionary *) data;

@end

NS_ASSUME_NONNULL_END
