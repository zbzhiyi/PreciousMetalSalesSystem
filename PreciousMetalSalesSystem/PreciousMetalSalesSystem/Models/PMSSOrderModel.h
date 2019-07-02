//
//  PMSSOrderModel.h
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMSSGoodsModel.h"
#import "PMSSCustomerFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface PMSSOrderModel : NSObject

/**
 订单编号
 */
@property (nonatomic, copy) NSString *orderId;

/**
 订单所属用户id
 */
@property (nonatomic, copy) NSString *memberId;

/**
 订单所属用户对象
 */
@property (nonatomic, strong) PMSSCustomerModel *customerModel;

/**
 订单创建时间
 */
@property (nonatomic, copy) NSString *createTime;

/**
 产品列表:数组元素为PMSSGoodsModel 类型
 */
@property (nonatomic, copy) NSArray *goodModelArray;

@property (nonatomic, copy) NSArray *discountCards;

/**
 打折金额
 */
@property (nonatomic, assign) CGFloat discountPrice;

/**
 原有金额
 */
@property (nonatomic, assign) CGFloat originTotalPrice;


/**
 新增积分
 */
@property (nonatomic, assign) NSInteger points;

/**
 用户是否升级
 */
@property (nonatomic, assign) BOOL isUpdateLevel;



-(id)initWithData:(NSDictionary *)data;

-(NSString *)getLogStringOfPaymentInfo;
-(NSString *)getLogStringOfOrderDiscountInfo;
-(NSString *)getLogStringOfOrderInfo;
-(NSString *)getLogStringOfPointsInfo;
-(NSString *)getLogStringOfOrderGoodsInfo;

@end

NS_ASSUME_NONNULL_END
