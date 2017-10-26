//
//  SYTesterManager.h
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/19.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,ItemMenuType) {
    
    ItemMenuTypeAnswer = 200,
    ItemMenuTypeDLog   = 201,
};

@interface itemMenuPoint :NSObject

@property (nonatomic,assign)CGPoint menuPoint;
@property (nonatomic,assign)CGRect frame;
@property (nonatomic,strong)UILabel *title;

@end

@interface SYTesterManager : UIView

- (instancetype )initWithFrame:(CGRect)frame withItemCount:(NSInteger )count Distance:(CGFloat )distance;


/**
 item数量
 */
@property(nonatomic,assign)NSInteger itemCount;

/**
 item 与主圆之间的距离 
 */
@property(nonatomic,assign)CGFloat distance;

@end
