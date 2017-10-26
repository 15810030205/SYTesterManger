//
//  OriginMenu.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/25.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "OriginMenu.h"

@implementation OriginMenu

- (void)drawRect:(CGRect)rect {

}

- (instancetype )initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.layer.cornerRadius = frame.size.width/2;
        _title = [[UILabel alloc]initWithFrame:frame];
        _title.textColor = [UIColor blackColor];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont systemFontOfSize:12];
        [self addSubview:_title];
        
        self.clipsToBounds = YES;
    }
    return self;
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
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"K_ChangeOriginMenuPostion" object:self];
}
@end
