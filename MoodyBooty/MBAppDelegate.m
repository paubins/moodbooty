//
//  MBAppDelegate.m
//  MoodyBooty
//
//  Created by paubins on 7/17/13.
//  Copyright (c) 2013 paubins. All rights reserved.
//

#import "MBAppDelegate.h"
#import "MBQuoteViewController.h"
#import "MBQuoteMoodViewController.h"
#import "MBAboutViewController.h"
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@implementation MBAppDelegate


- (NSString *)getUUID
{
    CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
    NSString * uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
    CFRelease(newUniqueId);
    
    return uuidString;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window = window;
    
//    [application setStatusBarStyle:UIStatusBarStyleLightContent];
//    self.window.clipsToBounds =YES;
//    self.window.frame =  CGRectMake(0,20,self.window.frame.size.width,self.window.frame.size.height-20);
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setBool:NO forKey:@"aboutShown"];
    
    NSString *cfuuid;
    if ( [prefs stringForKey:@"cfuuid"] == nil) {
        cfuuid = [self getUUID];
        [prefs setValue:cfuuid forKey:@"cfuuid"];
        [prefs synchronize];
    }

    MBQuoteMoodViewController *controller = [MBQuoteMoodViewController new];
    self.window.rootViewController = controller;
    self.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [self.window makeKeyAndVisible];

    
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
