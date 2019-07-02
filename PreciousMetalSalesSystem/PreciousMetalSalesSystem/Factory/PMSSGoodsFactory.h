//
//  PMSSGoodsFactory.h
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMSSGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PMSSGoodsFactory : NSObject

+ (PMSSGoodsFactory *)sharedInstance;


/**
 所有的商品列表，以goodID为Key
 */
@property (nonatomic,strong) NSMutableDictionary *goodsDictionary;

@property (nonatomic,strong) NSMutableArray *discountInfoArray;

- (PMSSGoodsModel *)getModelFromID:(NSString *)goodsId;

- (CGFloat)getTotalPriceWithGoodModel:(PMSSGoodsModel *)goodModel amount:(NSUInteger )amount discountArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
