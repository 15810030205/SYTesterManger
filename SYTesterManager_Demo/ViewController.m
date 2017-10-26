//
//  ViewController.m
//  SYTesterManager_Demo
//
//  Created by haosy on 2017/10/19.
//  Copyright © 2017年 haosy. All rights reserved.
//

#import "ViewController.h"
#import "SYTesterManager.h"


@interface ViewController ()

@property (nonatomic,strong)SYTesterManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
//    [[[UIApplication sharedApplication]keyWindow] addSubview:self.manager];
    
}


//- (SYTesterManager *)manager
//{
//    if (!_manager) {
//        _manager = [SYTesterManager initWithFrame:CGRectMake(200, 200, 40, 40)];
//        _manager.itemCount = 6;
//        _manager.distance = 40;
//    }
//    return _manager;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
