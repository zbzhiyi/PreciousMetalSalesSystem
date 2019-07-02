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
    orderModel.discountPrice = orderModel.originTotalPrice - price;
    
    
    
    NSInteger oldPoint = orderModel.customerModel.points;
    NSString *oldLeveName = orderModel.customerModel.level.levelName;
    [orderModel.customerModel resetPoints:price];
    orderModel.points = orderModel.customerModel.points - oldPoint;
    orderModel.isUpdateLevel = ![orderModel.customerModel.level.levelName isEqualToString:oldLeveName];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    textView.text = [NSString stringWithFormat:@"%@\n\n%@\n%@\n%@\n%@", [orderModel getLogStringOfOrderInfo],[orderModel getLogStringOfOrderGoodsInfo],[orderModel getLogStringOfOrderDiscountInfo],[orderModel getLogStringOfPaymentInfo],[orderModel getLogStringOfPointsInfo]];
    
    [self.view addSubview:textView];
}


@end
