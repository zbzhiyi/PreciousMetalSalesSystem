//
//  PMSSDiscountModel.m
//  PreciousMetalSalesSystem
//
//  Created by 冯宇飞 on 2019/7/2.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "PMSSDiscountModel.h"

@implementation PMSSDiscountModel
-(id)initWithName:(NSString *) name
{
    self = [super init];
    if (self) {
        self.discoutName = name;
        self.discoutType = DiscountTypeNone;

        if ([name containsString:@"9折"])
        {
            self.discoutType = DiscountType9;
            self.discoutNum = 0.9;
        } else if ([name containsString:@"95折"])
        {
            self.discoutType = DiscountType95;
            self.discoutNum = 0.95;
        }

    }
    return self;
}

@end
