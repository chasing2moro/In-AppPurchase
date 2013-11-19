//
//  IAPManager.h
//  IAPDemo
//
//  Created by yaowan on 13-11-16.
//  Copyright (c) 2013年 bobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#import "ARCSingletonTemplate.h"

@protocol IAPManagerProductsDelegate <NSObject>
- (void)receivedProducts:(NSArray *)products;
@end

@interface IAPManager : NSObject <SKProductsRequestDelegate, SKPaymentTransactionObserver>{
    SKPaymentTransaction *_transaction;
}
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, weak) id productsDelegate;

//从本地返回 product ID
+ (NSArray *)productIdentifiers;

//从iTunes Store 请求products
//productIdentifiers = nil , 请求所有本地返回product ID 对应的 product
- (void) requestProductsByIdentifiers:(NSArray *)productIdentifiers productsDelegate:(id)productsDelegate;

//请求购买
+ (void) requestPaymentByProduct:(SKProduct *)product quantity:(NSUInteger)quantity;

SYNTHESIZE_SINGLETON_FOR_HEADER(IAPManager)
@end
