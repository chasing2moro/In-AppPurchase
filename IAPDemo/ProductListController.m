//
//  ProductListController.m
//  IAPDemo
//
//  Created by yaowan on 13-11-16.
//  Copyright (c) 2013年 bobo. All rights reserved.
//

#import "ProductListController.h"
#import "IAPManager.h"

@interface ProductListController ()

@end

@implementation ProductListController
static NSString *CellIdentifier = @"Cell";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    }
    return self;
}

- (void)dealloc{
     [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //注册tableViewCell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    _indicator = [CommonHelper createdIndicatorAddToSubViewCenterBySubView:self.view];
    if (self.products == nil) {
        [[IAPManager sharedIAPManager] requestProductsByIdentifiers:nil productsDelegate:self];
        [_indicator startAnimating];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)description{
    return @"ProductList";
}

#pragma mark - Delegate
- (void)receivedProducts:(NSArray *)products{
    [_indicator stopAnimating];
    if (products == nil) {
        [CommonHelper showTipWithTitle:nil msg:@"Load products from iTunes Store encounter error"];
    }else{
        self.products = products;
        [self.tableView reloadData];
    }
}

// Sent when the transaction array has changed (additions or state changes).  Client should check state of transactions and finish as appropriate.
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
            {
                [_indicator stopAnimating];
            }
                break;
            case SKPaymentTransactionStateFailed:
            {
                [_indicator stopAnimating];
            }
                break;
            case SKPaymentTransactionStateRestored:
            {
                [_indicator stopAnimating];
            }
                break;
            default:
                break;
        }
    }
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    if (self.products == nil) {
        return;
    }
    
    //
    SKProduct *product = [self.products objectAtIndex:indexPath.row];
    if (product == nil) {
        return;
    }
    
    //
    [_indicator startAnimating];
    [IAPManager requestPaymentByProduct:product quantity:1];
}

#pragma mark - Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products == nil ? 0 : self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    SKProduct *product = [self.products objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", product.localizedDescription];

#if 0
    //根据 product.priceLocale & product.price 输出 适当的货币表现形式
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:product.priceLocale];
    NSString *formattedPrice = [numberFormatter stringFromNumber:product.price];
    NSLog(@"price :%@", formattedPrice);
#endif
    return cell;
}



@end
