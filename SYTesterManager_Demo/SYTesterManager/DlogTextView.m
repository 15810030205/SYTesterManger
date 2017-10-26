//
//  DlogTextView.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/25.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "DlogTextView.h"

@interface DlogTextView ()
@property (nonatomic,strong)UIView *header;

@end

@implementation DlogTextView

- (void)drawRect:(CGRect)rect {

}

- (instancetype )initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:13];
        self.editable = NO;
    }
    return self;
}


@end
