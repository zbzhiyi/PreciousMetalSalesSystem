//
//  PMSSLevelModel.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "PMSSLevelModel.h"

@implementation PMSSLevelModel

-(id)initWithLevel:(CustomerLevelType ) level
{
    self = [super init];
    if (self) {
        self.level = level;
        switch (self.level) {
            case CustomerLevelOfOrdinaryCard:
            {
                self.levelName = @"普通卡";
                self.pointScale = 1;
            }
                break;
            case CustomerLevelOfGoldCard:
            {
                self.levelName = @"金卡";
                self.pointScale = 1.5;
            }
                break;
            case CustomerLevelOfPlatinumCard:
            {
                self.levelName = @"白金卡";
                self.pointScale = 1.8;
            }
                break;
            case CustomerLevelOfDiamondCard:
            {
                self.levelName = @"钻石卡";
                self.pointScale = 2;
            }
                break;
                
            default:
                break;
        }
    }
    return self;
}

@end
