//
//  ViewController.m
//  LMLNoNetPlaceholderDemo
//
//  Created by 优谱德 on 16/9/19.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "ViewController.h"
#import "LMLNoNetPlaceholder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [LMLNoNetPlaceholder dismiss];
}
- (IBAction)show:(UIButton *)sender {
    
    CGRect frame = self.view.frame;
    
    [LMLNoNetPlaceholder showWithFrame:frame withView:self.view placeholderStr:@"暂无网络"];
}

@end
