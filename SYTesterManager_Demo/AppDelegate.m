//
//  AppDelegate.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/19.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "AppDelegate.h"
#import "SYTesterManager.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic,strong)SYTesterManager *manager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[ViewController alloc] init];
    
    
    [self.window makeKeyAndVisible];
    
//    [[UIApplication sharedApplication].keyWindow addSubview:self.manager];
    
    _manager = [[SYTesterManager alloc]initWithFrame:CGRectMake(200, 200, 40, 40) withItemCount:2 Distance:20.0f];

    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
