//
//  PMSSDiscountModel.h
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DiscountType) {
    DiscountTypeNone,     //默认为不可用
    DiscountType9,        //可用9折券
    DiscountType95,       // 可用95折券
    
    
};
NS_ASSUME_NONNULL_BEGIN

@interface PMSSDiscountModel : NSObject

/**
 折扣名
 */
@property (nonatomic,copy) NSString *discoutName;

/**
 折扣数值
 */
@property (nonatomic,assign)CGFloat discoutNum;

/**
 折扣类型
 */
@property (nonatomic,assign)DiscountType discoutType;

@end

NS_ASSUME_NONNULL_END
