//
//  SYTesterManager.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/19.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "SYTesterManager.h"
#import "itemMenu.h"
#import "OriginMenu.h"
#import "DlogManager.h"
#import "LogTextManager.h"

#define K_Keywindow [[UIApplication sharedApplication] keyWindow]
@implementation itemMenuPoint

@end


@interface SYTesterManager ()
@property (nonatomic,strong)OriginMenu *menu;//原点menu
@property (nonatomic,strong)DlogManager *logManager;//显示view

@property (nonatomic,strong)NSMutableArray *itemArray;
@property (nonatomic,strong)NSMutableArray *arriveArray;//到达点数组
@property (nonatomic,strong)NSMutableArray *orginalArray;//源点数组

@property (nonatomic,assign)CGFloat menuD;//圆圈直径
@property (nonatomic,assign)CGPoint OriginPoint;//原点(中心点)
@property (nonatomic,assign)BOOL isExpand;//是否展开
@property (nonatomic,assign)BOOL isAppearAnswer;//是否打开显示答案
@property (nonatomic,assign)BOOL isAppearDlog;//是否显示log信息




@end

@implementation SYTesterManager


- (instancetype )initWithFrame:(CGRect)frame withItemCount:(NSInteger )count Distance:(CGFloat )distance
{
    self = [super initWithFrame:frame];
    
    if (self) {
        CGFloat originx = frame.origin.x + frame.size.width/2;
        CGFloat originy = frame.origin.y + frame.size.height/2;
        self.OriginPoint = CGPointMake(originx, originy);
        self.itemCount = count;
        self.distance = distance;
        self.menuD= frame.size.width;
        self.isExpand = NO;
        [self configureUI];
        [self addNotificationCenter];
    }
    return self;
}
- (void)addNotificationCenter
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeLogtextContent) name:K_SYNotificationLog object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeAnswerContent) name:K_SYAnswerNotifacation object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeItemOriginalPostion:) name:@"K_ChangeOriginMenuPostion" object:nil];
}




- (void)configureUI
{
    _itemArray = [NSMutableArray new];
    
    for (int i =0 ; i< self.itemCount; i++) {
        itemMenu *item = [[itemMenu alloc]initWithFrame:self.bounds];
//        item.frame = self.bounds;
        item.center = self.OriginPoint;
        item.backgroundColor = [UIColor greenColor];
        item.title.text = [NSString stringWithFormat:@"%d",i];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemAction:)];
        [item addGestureRecognizer:gesture];
        UIView *tapView = [gesture view];
        tapView.tag = i +200;
        [K_Keywindow addSubview:item];
        [_itemArray addObject:item];
    }
    
    _menu = [[OriginMenu alloc]initWithFrame:self.bounds];
//    _menu.frame = self.bounds;
    _menu.center = self.OriginPoint;
    _menu.backgroundColor = [UIColor redColor];
    _menu.layer.cornerRadius = self.frame.size.width/2;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(menuAction)];
    [_menu addGestureRecognizer:gesture];
    
    [K_Keywindow addSubview:_menu];
    
    [self addArriveArray];
}
- (void)addArriveArray
{
    _arriveArray = [NSMutableArray new];
    
    for (int i = 0; i <self.itemCount; i++) {
        //确定象限
        CGFloat x = 1;
        CGFloat y = 1;
        //角度
        NSInteger angle = i * 45;
        
        //源点
        CGPoint itemOriginPoint = self.OriginPoint;
        CGFloat disX = itemOriginPoint.x;
        CGFloat disY = itemOriginPoint.y;
        
        //目标点
        CGFloat arriveX = 0;
        CGFloat arriveY = 0;
        
        //目标点与源点相差xy值
        CGFloat distanceX = 0;
        CGFloat distanceY = 0;
        
        
        if (angle == 0|| angle == 90 || angle ==180 ||angle == 270) {
             //对于45度角来说xy值相同 只要确定正负
            distanceX =  self.distance + _menuD ;
            distanceY =  self.distance + _menuD ;
        }else{
            distanceX = (self.distance + _menuD ) / 1.414;
            distanceY = (self.distance + _menuD ) / 1.414;
        }
        
        //系数
        if (angle == 0) {
            x = 0;
            y = -1;
        }else if (angle >0  && angle <90){
            x = 1;
            y = -1;

        }else if(angle ==90){
            x = 1;
            y = 0;
        }else if (angle >90 && angle < 180){
            x = 1;
            y = 1;
        }else if (angle == 180){
            x = 0;
            y = 1;
        }else if(angle > 180 && angle < 270){
            x = -1;
            y = 1;
        }else if (angle == 270){
            x = -1;
            y = 0;
        }else if (angle >270 && angle <360){
            x = -1;
            y = -1;
        }
        
        arriveX = x * distanceX + disX - _menuD/2;
        arriveY = y * distanceY + disY - _menuD/2;
        
        itemMenuPoint *menuPoint = [itemMenuPoint new];
        menuPoint.frame = CGRectMake(arriveX , arriveY, _menuD, _menuD);
        //存储目标的数组
        [_arriveArray addObject:menuPoint];
        
    }
    
   
   
    
}

/**
 大按钮点击状态
 */
- (void)menuAction
{
    
  
    if (_isExpand) {//当前是展开状态
        _isExpand = NO;
        [self resetItemFrame];
    }else{//当前是收起状态
        _isExpand = YES;
        [self expandItemFrame];
        
    }
    
}

/**
 每个按钮点击状态
 */
- (void)itemAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"点击了 %ld",[tap view].tag);
    
    switch ([tap view].tag ) {
        case ItemMenuTypeAnswer:
        {
            if (_isAppearAnswer) {
                _isAppearAnswer = NO;
                _menu.title.text = @"";
                [LogTextManager clearAnswer];
                
            }else{
                _isAppearAnswer = YES;
                _menu.title.text = [LogTextManager obtanAnswer];

            }
        }
            break;
        case ItemMenuTypeDLog:
        {
            if (_isAppearDlog) {
                _isAppearDlog = NO;
                [self removelogTextView];
            }else{
                _isAppearDlog = YES;
                [self addDelogTextView];
            }
            
        }
            
            break;
        default:
            break;
    }
    
    [self resetItemFrame];
}

/**
 展开方法
 */
- (void )expandItemFrame
{
    for (int i = 0; i < _itemArray.count; i++) {
        itemMenu *item = _itemArray[i];
        itemMenuPoint *menuPoint = _arriveArray[i];
 
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3f initialSpringVelocity:0.9f options:UIViewAnimationOptionCurveLinear animations:^{
            
            item.frame = menuPoint.frame;
            if ( i == 0) {
                item.title.text = @"答";
            }else if (i == 1){
                
                item.title.text = @"log";
            }
            [_itemArray replaceObjectAtIndex:i withObject:item];
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

/**
 收起方法
 */
-(void)resetItemFrame
{
    for (int i = 0; i <_itemArray.count; i++) {
    itemMenu *item = _itemArray[i];

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6f initialSpringVelocity:0.9f options:UIViewAnimationOptionCurveLinear animations:^{
        
        item.center = self.OriginPoint;
        [_itemArray replaceObjectAtIndex:i withObject:item];
    } completion:^(BOOL finished) {
        
    }];
        
}
    
}

- (void)removelogTextView
{
    [self.logManager removeFromSuperview];
}

- (void)addDelogTextView
{
    [K_Keywindow addSubview:self.logManager];
}

- (DlogManager *)logManager
{
    
    if (!_logManager) {
        _logManager = [[DlogManager alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
        _logManager.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        _logManager.dlogView.text =[LogTextManager obtanLog] ;
       
    }
    return _logManager;
}
- (void)changeItemOriginalPostion:(NSNotification *)noti
{
    OriginMenu *menu = (OriginMenu *)noti.object;
    
    self.OriginPoint = menu.center;
    
    [self addArriveArray];
}
- (void)changeAnswerContent
{
    if (_isAppearAnswer) {
        _menu.title.text = [LogTextManager obtanAnswer];
    }
}
- (void)changeLogtextContent
{
    _logManager.dlogView.text =[LogTextManager obtanLog];
    
}

@end
