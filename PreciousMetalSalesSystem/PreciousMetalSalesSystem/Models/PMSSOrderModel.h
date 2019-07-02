//
//  PMSSOrderModel.h
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMSSGoodsModel.h"

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
 订单创建时间
 */
@property (nonatomic, copy) NSString *createTime;

/**
 产品列表:数组元素为PMSSGoodsModel 类型
 */
@property (nonatomic, copy) NSArray *goodModelArray;


@end

NS_ASSUME_NONNULL_END
