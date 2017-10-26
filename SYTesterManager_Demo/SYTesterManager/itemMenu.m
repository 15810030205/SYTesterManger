//
//  itemMenu.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/19.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "itemMenu.h"
#import "OriginMenu.h"

@implementation itemMenu


- (void)drawRect:(CGRect)rect {

    
}
- (instancetype )initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.layer.cornerRadius = frame.size.width/2;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor cyanColor];
        _title = [[UILabel alloc]initWithFrame:frame];
        _title.textColor = [UIColor blackColor];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont systemFontOfSize:12];
        [self addSubview:_title];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeSelfPostion:) name:@"K_ChangeOriginMenuPostion" object:nil];
    }
    return self;
}


- (void)changeSelfPostion:(NSNotification *)noti
{
    OriginMenu *menu = (OriginMenu *)noti.object;
    
    self.center = menu.center;
}

@end
