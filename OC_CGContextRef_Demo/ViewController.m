//
//  ViewController.m
//  OC_CGContextRef_Demo
//
//  Created by 郑惠珠 on 2017/3/13.
//  Copyright © 2017年 Ashimar ZHENG. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomView *customView = [[CustomView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:customView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
