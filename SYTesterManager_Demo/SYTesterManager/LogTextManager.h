//
//  LogTextManager.h
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/25.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define K_SYDlogUserDefault @"K_SYDlogUserDefault"
#define K_SYNotificationLog @"K_SYNotificationLog"

//answer
#define K_SYAnswerUserDefault @"K_SYAnswerUserDefault"
#define K_SYAnswerNotifacation @"K_SYAnswerNotifacation"

@interface LogTextManager : NSObject

/**
 log相关存储
 */
+(void)saveLog:(NSString *)text;
+(NSString *)obtanLog;
+(void)clearAllLog;


/**
 answer相关存储
 */
+(void)saveAnswer:(NSString *)text;
+(NSString *)obtanAnswer;
+(void)clearAnswer;

@end
