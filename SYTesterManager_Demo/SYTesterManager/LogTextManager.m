//
//  LogTextManager.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/25.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "LogTextManager.h"



@implementation LogTextManager

+(void)saveLog:(NSString *)text
{
        NSString *string = [[NSUserDefaults standardUserDefaults]objectForKey:K_SYDlogUserDefault];
    if (string.length > 0) {

        string = [string stringByAppendingString:text];
    }else{
        string = [NSString stringWithString:text];
    }
        [[NSUserDefaults standardUserDefaults]setObject:string forKey:K_SYDlogUserDefault];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:K_SYNotificationLog object:nil];
    
    
}
+ (NSString *)obtanLog
{
     NSString *string = [[NSUserDefaults standardUserDefaults]objectForKey:K_SYDlogUserDefault];
   
    return string;
}
+(void)clearAllLog
{
    [[NSUserDefaults standardUserDefaults]setObject:@" " forKey:K_SYDlogUserDefault];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:K_SYNotificationLog object:nil];
}


/**
 answer相关存储
 */
+(void)saveAnswer:(NSString *)text;
{
    NSString *string =@"";
    
    string = [NSString stringWithString:text];
   
    [[NSUserDefaults standardUserDefaults]setObject:string forKey:K_SYAnswerUserDefault];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:K_SYAnswerNotifacation object:nil];
}
+(NSString *)obtanAnswer;
{
    NSString *string = [[NSUserDefaults standardUserDefaults]objectForKey:K_SYAnswerUserDefault];
    return string;
}
+(void)clearAnswer;
{
    [[NSUserDefaults standardUserDefaults]setObject:@" " forKey:K_SYAnswerUserDefault];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:K_SYAnswerNotifacation object:nil];
}


@end
