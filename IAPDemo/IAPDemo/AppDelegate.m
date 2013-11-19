//
//  AppDelegate.m
//  IAPDemo
//
//  Created by yaowan on 13-11-16.
//  Copyright (c) 2013年 bobo. All rights reserved.
//

#import "AppDelegate.h"
#import "IAPManager.h"
#import "ASIHTTPRequest.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [IAPManager sharedIAPManager];
    NSString *str = @"ApbN+o4Ve+8sSQN+eXmmBiI/u/ponuqtIeTI1i5osiQhRiprsJ33LXAMWx4BakIUTszR51neb7nayyJoUmpff5wviLFNPEvQctwT9wCjVk7BTab4bTa8qGaZ3jQ5IGFEAubK6kc3aob3RM7ljLfTCist45KMKcmi5Mn5pUrmJhm9AAADVzCCA1MwggI7oAMCAQICCGUUkU3ZWAS1MA0GCSqGSIb3DQEBBQUAMH8xCzAJBgNVBAYTAlVTMRMwEQYDVQQKDApBcHBsZSBJbmMuMSYwJAYDVQQLDB1BcHBsZSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEzMDEGA1UEAwwqQXBwbGUgaVR1bmVzIFN0b3JlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA5MDYxNTIyMDU1NloXDTE0MDYxNDIyMDU1NlowZDEjMCEGA1UEAwwaUHVyY2hhc2VSZWNlaXB0Q2VydGlmaWNhdGUxGzAZBgNVBAsMEkFwcGxlIGlUdW5lcyBTdG9yZTETMBEGA1UECgwKQXBwbGUgSW5jLjELMAkGA1UEBhMCVVMwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMrRjF2ct4IrSdiTChaI0g8pwv/cmHs8p/RwV/rt/91XKVhNl4XIBimKjQQNfgHsDs6yju++DrKJE7uKsphMddKYfFE5rGXsAdBEjBwRIxexTevx3HLEFGAt1moKx509dhxtiIdDgJv2YaVs49B0uJvNdy6SMqNNLHsDLzDS9oZHAgMBAAGjcjBwMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUNh3o4p2C0gEYtTJrDtdDC5FYQzowDgYDVR0PAQH/BAQDAgeAMB0GA1UdDgQWBBSpg4PyGUjFPhJXCBTMzaN+mV8k9TAQBgoqhkiG92NkBgUBBAIFADANBgkqhkiG9w0BAQUFAAOCAQEAEaSbPjtmN4C/IB3QEpK32RxacCDXdVXAeVReS5FaZxc+t88pQP93BiAxvdW/3eTSMGY5FbeAYL3etqP5gm8wrFojX0ikyVRStQ+/AQ0KEjtqB07kLs9QUe8czR8UGfdM1EumV/UgvDd4NwNYxLQMg4WTQfgkQQVy8GXZwVHgbE/UC6Y7053pGXBk51NPM3woxhd3gSRLvXj+loHsStcTEqe9pBDpmG5+sk4tw+GK3GMeEN5/+e1QT9np/Kl1nj+aBw7C0xsy0bFnaAd1cSS6xdory/CUvM6gtKsmnOOdqTesbp0bs8sn6Wqs0C9dgcxRHuOMZ2tm8npLUm7argOSzQ==";
    NSData *data = [NSData dataWithBytes:[str UTF8String] length:strlen([str UTF8String])];
    str = [ASIHTTPRequest base64forData:data];
    NSLog(@"str=%@", str);
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

/*
 {
 "signature" = "ApbN+o4Ve+8sSQN+eXmmBiI/u/ponuqtIeTI1i5osiQhRiprsJ33LXAMWx4BakIUTszR51neb7nayyJoUmpff5wviLFNPEvQctwT9wCjVk7BTab4bTa8qGaZ3jQ5IGFEAubK6kc3aob3RM7ljLfTCist45KMKcmi5Mn5pUrmJhm9AAADVzCCA1MwggI7oAMCAQICCGUUkU3ZWAS1MA0GCSqGSIb3DQEBBQUAMH8xCzAJBgNVBAYTAlVTMRMwEQYDVQQKDApBcHBsZSBJbmMuMSYwJAYDVQQLDB1BcHBsZSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEzMDEGA1UEAwwqQXBwbGUgaVR1bmVzIFN0b3JlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA5MDYxNTIyMDU1NloXDTE0MDYxNDIyMDU1NlowZDEjMCEGA1UEAwwaUHVyY2hhc2VSZWNlaXB0Q2VydGlmaWNhdGUxGzAZBgNVBAsMEkFwcGxlIGlUdW5lcyBTdG9yZTETMBEGA1UECgwKQXBwbGUgSW5jLjELMAkGA1UEBhMCVVMwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMrRjF2ct4IrSdiTChaI0g8pwv/cmHs8p/RwV/rt/91XKVhNl4XIBimKjQQNfgHsDs6yju++DrKJE7uKsphMddKYfFE5rGXsAdBEjBwRIxexTevx3HLEFGAt1moKx509dhxtiIdDgJv2YaVs49B0uJvNdy6SMqNNLHsDLzDS9oZHAgMBAAGjcjBwMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUNh3o4p2C0gEYtTJrDtdDC5FYQzowDgYDVR0PAQH/BAQDAgeAMB0GA1UdDgQWBBSpg4PyGUjFPhJXCBTMzaN+mV8k9TAQBgoqhkiG92NkBgUBBAIFADANBgkqhkiG9w0BAQUFAAOCAQEAEaSbPjtmN4C/IB3QEpK32RxacCDXdVXAeVReS5FaZxc+t88pQP93BiAxvdW/3eTSMGY5FbeAYL3etqP5gm8wrFojX0ikyVRStQ+/AQ0KEjtqB07kLs9QUe8czR8UGfdM1EumV/UgvDd4NwNYxLQMg4WTQfgkQQVy8GXZwVHgbE/UC6Y7053pGXBk51NPM3woxhd3gSRLvXj+loHsStcTEqe9pBDpmG5+sk4tw+GK3GMeEN5/+e1QT9np/Kl1nj+aBw7C0xsy0bFnaAd1cSS6xdory/CUvM6gtKsmnOOdqTesbp0bs8sn6Wqs0C9dgcxRHuOMZ2tm8npLUm7argOSzQ==";
 "purchase-info" = "ewoJIm9yaWdpbmFsLXB1cmNoYXNlLWRhdGUtcHN0IiA9ICIyMDEzLTExLTE4IDA1OjAxOjE2IEFtZXJpY2EvTG9zX0FuZ2VsZXMiOwoJInVuaXF1ZS1pZGVudGlmaWVyIiA9ICJjZjUyMDMzMWRiYzE2ZTBjNzk5OWE0M2ZmNjRlZTA5ZGU3NzE4NDk3IjsKCSJvcmlnaW5hbC10cmFuc2FjdGlvbi1pZCIgPSAiMTAwMDAwMDA5Mzc2ODI1OCI7CgkiYnZycyIgPSAiMS4wIjsKCSJ0cmFuc2FjdGlvbi1pZCIgPSAiMTAwMDAwMDA5Mzc2ODI1OCI7CgkicXVhbnRpdHkiID0gIjEiOwoJIm9yaWdpbmFsLXB1cmNoYXNlLWRhdGUtbXMiID0gIjEzODQ3Nzk2NzY5MTkiOwoJInVuaXF1ZS12ZW5kb3ItaWRlbnRpZmllciIgPSAiMjUwNjEwQ0ItNDU3RS00OUQxLUJGNEYtNUY2Nzg2REUwM0Q5IjsKCSJwcm9kdWN0LWlkIiA9ICJjb20ueWFvd2FuLmxzeXguamluYmkxLjk5IjsKCSJpdGVtLWlkIiA9ICI2MjIwMjU1ODAiOwoJImJpZCIgPSAiY29tLnlhb3dhbi5sc3l4IjsKCSJwdXJjaGFzZS1kYXRlLW1zIiA9ICIxMzg0Nzc5Njc2OTE5IjsKCSJwdXJjaGFzZS1kYXRlIiA9ICIyMDEzLTExLTE4IDEzOjAxOjE2IEV0Yy9HTVQiOwoJInB1cmNoYXNlLWRhdGUtcHN0IiA9ICIyMDEzLTExLTE4IDA1OjAxOjE2IEFtZXJpY2EvTG9zX0FuZ2VsZXMiOwoJIm9yaWdpbmFsLXB1cmNoYXNlLWRhdGUiID0gIjIwMTMtMTEtMTggMTM6MDE6MTYgRXRjL0dNVCI7Cn0=";
 "environment" = "Sandbox";
 "pod" = "100";
 "signing-status" = "0";
 }
 */
/*
"purchase-info" =
{
	"original-purchase-date-pst" = "2013-11-18 05:01:16 America/Los_Angeles";
	"unique-identifier" = "cf520331dbc16e0c7999a43ff64ee09de7718497";
	"original-transaction-id" = "1000000093768258";
	"bvrs" = "1.0";
	"transaction-id" = "1000000093768258";
	"quantity" = "1";
	"original-purchase-date-ms" = "1384779676919";
	"unique-vendor-identifier" = "250610CB-457E-49D1-BF4F-5F6786DE03D9";
	"product-id" = "com.yaowan.lsyx.jinbi1.99";
	"item-id" = "622025580";
	"bid" = "com.yaowan.lsyx";
	"purchase-date-ms" = "1384779676919";
	"purchase-date" = "2013-11-18 13:01:16 Etc/GMT";
	"purchase-date-pst" = "2013-11-18 05:01:16 America/Los_Angeles";
	"original-purchase-date" = "2013-11-18 13:01:16 Etc/GMT";
}
 */
