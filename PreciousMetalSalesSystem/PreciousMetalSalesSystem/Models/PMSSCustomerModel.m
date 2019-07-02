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

-(void)resetAmount:(CGFloat) payment
{

}

-(void)resetPoints:(NSString *) payment
{
    CGFloat paymentValue = [payment floatValue];

}

-(id)initWithData:(NSDictionary *) data
{
    self = [super init];
    if (self) {
        self.amount = CGFLOAT_MAX;
        self.name = data[@"Name"];
        self.memberId = data[@"MemberId"];
        self.points = [data[@"Points"] integerValue];
        self.level = [[PMSSLevelModel alloc] initWithLevelName:data[@"LevelName"]];
    }
    return self;
}

@end
