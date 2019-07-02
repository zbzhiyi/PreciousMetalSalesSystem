//
//  PMSSCalculatedManager.h
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PMSSOrderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PMSSCalculatedManager : NSObject

+(CGFloat)calculatedByOrder:(PMSSOrderModel *) orderModel;

@end

NS_ASSUME_NONNULL_END
