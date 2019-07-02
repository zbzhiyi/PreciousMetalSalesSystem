//
//  PMSSCustomerModel.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSCustomerModel.h"
#import <UIKit/UIKit.h>

@implementation PMSSCustomerModel

-(void)resetAmount:(NSString *) payment
{
    CGFloat paymentValue = [payment floatValue];
    CGFloat amountValue = [self.amount floatValue];
    amountValue = amountValue - paymentValue;
    self.amount = [NSString stringWithFormat:@"%f",amountValue];
}

-(void)resetPoints:(NSString *) payment
{
    CGFloat paymentValue = [payment floatValue];
    
}
@end
