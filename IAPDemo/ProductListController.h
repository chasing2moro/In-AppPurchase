//
//  ProductListController.h
//  IAPDemo
//
//  Created by yaowan on 13-11-16.
//  Copyright (c) 2013年 bobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface ProductListController : UITableViewController <SKPaymentTransactionObserver>{
    UIActivityIndicatorView *_indicator;
}
@property (nonatomic, strong) NSArray *products;

@end
