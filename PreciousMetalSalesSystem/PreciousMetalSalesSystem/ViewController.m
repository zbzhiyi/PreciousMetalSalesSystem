//
//  ViewController.m
//  PreciousMetalSalesSystem
//
//  Created by ZB on 2019/7/2.
//  Copyright © 2019年 ZB. All rights reserved.
//

#import "ViewController.h"
#import "PMSSCalculatedManager.h"
#import "PMSSOrderModel.h"
#import "PMSSGoodsFactory.h"
#import "PMSSCustomerFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"simple_command" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:strPath];
    NSDictionary *templateServiceData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    PMSSOrderModel *orderModel = [[PMSSOrderModel alloc] initWithData:templateServiceData];
    CGFloat price = [PMSSCalculatedManager calculatedPriceByOrder:orderModel];
    
    PMSSCustomerFactory *customerFactory = [PMSSCustomerFactory sharedInstance];
    PMSSCustomerModel *customer = [customerFactory getCustomerByMemberId:orderModel.memberId];
    [customer resetPoints:price];
    
    
    
}


@end
