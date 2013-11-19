//
//  ViewController.m
//  IAPDemo
//
//  Created by yaowan on 13-11-16.
//  Copyright (c) 2013年 bobo. All rights reserved.
//

#import "ViewController.h"
#import "ProductListController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _indicators = [[NSArray alloc] initWithObjects:[[ProductListController alloc] init], nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataSource (UITableViewDataSource)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _indicators.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifiers = @"identifiers";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiers];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiers];
    }
    cell.textLabel.text = [[_indicators objectAtIndex:indexPath.row] description];
    return cell;
}

#pragma mark - Delegate (UITableViewDelegate)

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.navigationController pushViewController:[_indicators objectAtIndex:indexPath.row] animated:YES];
}
@end
