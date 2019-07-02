//
//  PMSSCustomerFactory.h
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PMSSCustomerFactory : NSObject

@property (nonatomic, copy) NSDictionary *customerDic;

+ (PMSSCustomerFactory *)sharedInstance;

- (void)buildCustomerData;

@end

NS_ASSUME_NONNULL_END
