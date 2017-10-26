//
//  DlogManager.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/25.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "DlogManager.h"
#import "LogTextManager.h"

#define K_HeaderHeight 30
@interface DlogManager ()
@property (nonatomic,strong)UIView *header;
@property (nonatomic,strong)UIButton *ClearButton;

@end

@implementation DlogManager

- (void)drawRect:(CGRect)rect {

}

- (instancetype )initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        [self addSubview:self.header];
        [self addSubview:self.dlogView];
        self.layer.cornerRadius = 8.0f;
        self.clipsToBounds = YES;
    }
    return self;
}
- (UIView *)header
{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, K_HeaderHeight)];
        _header.backgroundColor = [UIColor colorWithRed:81/255.0 green:173/255.0 blue:236/255.0 alpha:0.4];
        _ClearButton = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width - 50, 0, 50, K_HeaderHeight)];
        [_ClearButton addTarget:self action:@selector(clearLogAction) forControlEvents:UIControlEventTouchUpInside ];
        [_ClearButton setTitle:@"清除" forState:UIControlStateNormal];
        [_header addSubview:_ClearButton];
    }
    return _header;
}
- (void)clearLogAction
{
    NSLog(@"清除");
    [LogTextManager clearAllLog];
}
- (DlogTextView *)dlogView
{
    if (!_dlogView) {
        
        CGRect frame = self.bounds;
        frame.origin.y = K_HeaderHeight;
        frame.size.height -= K_HeaderHeight;
        _dlogView = [[DlogTextView alloc]initWithFrame:frame];
        
        _dlogView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];

    }
    return _dlogView;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    // 当前触摸点
    CGPoint currentPoint = [touch locationInView:self.superview];
    // 上一个触摸点
    CGPoint previousPoint = [touch previousLocationInView:self.superview];
    
    // 当前view的中点
    CGPoint center = self.center;
    
    center.x += (currentPoint.x - previousPoint.x);
    center.y += (currentPoint.y - previousPoint.y);
    // 修改当前view的中点(中点改变view的位置就会改变)
    self.center = center;
}

@end
