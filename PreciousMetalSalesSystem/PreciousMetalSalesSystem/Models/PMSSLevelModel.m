//
//  PMSSLevelModel.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSLevelModel.h"

@implementation PMSSLevelModel

-(id)initWithLevelName:(NSString *) levelName
{
    self = [super init];
    if (self) {
        self.levelName = levelName;
        NSDictionary *pointScale = @{@"普通卡":@"1",@"金卡":@"1.5",@"白金卡":@"1.8",@"钻石卡":@"2"};
        self.pointScale = [pointScale[self.levelName] floatValue];
    }
    return self;
}

@end
