//
//  IAPManager.m
//  IAPDemo
//
//  Created by yaowan on 13-11-16.
//  Copyright (c) 2013年 bobo. All rights reserved.
//

#import "IAPManager.h"

@implementation IAPManager
SYNTHESIZE_SINGLETON_FOR_CLASS(IAPManager)

- (id)init{
    if (self = [super init]) {
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    }
    return self;
}

- (void)dealloc{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

+ (NSArray *)productIdentifiers{
    static NSArray *identifiers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"IAPList" withExtension:@"plist"];
        identifiers = [[NSArray alloc] initWithContentsOfURL:url];
    });
    return identifiers;
}

- (void) requestProductsByIdentifiers:(NSArray *)productIdentifiers productsDelegate:(id)productsDelegate{
    //default delegate
    if (productIdentifiers == nil) {
        productIdentifiers = [IAPManager productIdentifiers];
    }
    
    self.productsDelegate = productsDelegate;
    
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:
                                  [NSSet setWithArray:productIdentifiers]
                                  ];
    
    request.delegate = self;
    [request start];
}

+ (void) requestPaymentByProduct:(SKProduct *)product quantity:(NSUInteger)quantity{
    SKMutablePayment *payment = [SKMutablePayment paymentWithProduct:product];
    payment.quantity = quantity;
    if(![SKPaymentQueue canMakePayments]){
        [CommonHelper showTipWithTitle:nil msg:@"This account is not allow to make payments"];
        return;
    }
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    
}
#pragma mark - Delegate (SKProductsRequestDelegate)
// Sent immediately before -requestDidFinish:
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    self.products = response.products;
    
    if (self.productsDelegate != nil && [self.productsDelegate respondsToSelector:@selector(receivedProducts:)]) {
        [self.productsDelegate receivedProducts:self.products];
    }
    
    if (response.invalidProductIdentifiers != nil && response.invalidProductIdentifiers.count > 0){
        NSLog(@"exist invalid products:");
        for (NSString *invalidIdentifiers in response.invalidProductIdentifiers) {
            NSLog(@"%@", invalidIdentifiers);
        }
    }
}
#pragma mark - Delegate (SKRequestDelegate)
- (void)requestDidFinish:(SKRequest *)request{
    
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    if (error != nil) {
        NSLog(@"request products encounter error");
        if (self.productsDelegate != nil && [self.productsDelegate respondsToSelector:@selector(receivedProducts:)]) {
            [self.productsDelegate receivedProducts:nil];
        }
    }
}
#pragma mark - Delegate (SKPaymentTransactionObserver)
// Sent when the transaction array has changed (additions or state changes).  Client should check state of transactions and finish as appropriate.
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            /*
            case SKPaymentTransactionStatePurchasing:
            {
                                                            //Transaction is being added to the server queue.
            }
                break;
            */
            case SKPaymentTransactionStatePurchased:
            {
                [self _completeTransaction:transaction];    //Transaction is in queue, user has been charged.  Client should complete the transaction.
            }
                break;
            case SKPaymentTransactionStateFailed:
            {
                [self _failedTransaction:transaction];      //Transaction was cancelled or failed before being added to the server queue.
            }
                break;
            case SKPaymentTransactionStateRestored:
            {
                [self _restoreTransaction:transaction];     //Transaction was restored from user's purchase history.  Client should complete the transaction.
            }
                break;
            default:
                break;
        }
    }
}
#define TestFinishTransaction
- (void)_completeTransaction:(SKPaymentTransaction *)transaction{
#ifdef TestFinishTransaction
    _transaction = transaction;
    NSString *result = [[NSString alloc] initWithData:_transaction.transactionReceipt  encoding:NSUTF8StringEncoding];
    NSLog(@"Result:%@",  result);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"(Succeed) finishTransaction?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    [alert show];
#else
    [CommonHelper showTipWithTitle:nil msg:@"Purchase succeeded"];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
#endif
}

- (void)_failedTransaction:(SKPaymentTransaction *)transaction{
#ifdef TestFinishTransaction
    _transaction = transaction;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"(Failed) finishTransaction?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    [alert show];
#else
    [CommonHelper showTipWithTitle:nil msg:@"Purchase failed"];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
#endif
}

- (void)_restoreTransaction:(SKPaymentTransaction *)transaction{
    
#ifdef TestFinishTransaction
    _transaction = transaction;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"(Restore) finishTransaction?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    [alert show];
#else
    [CommonHelper showTipWithTitle:nil msg:@"Purchase restore succeed"];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
#endif
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [[SKPaymentQueue defaultQueue] finishTransaction:_transaction];
            break;
            
        default:
            break;
    }
}
@end

/*
 代码块 声明例子
 int (^triple)(int) = ^(int number) {
    return number * 3;
 };
 */