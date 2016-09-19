//
//  LMLNoNetPlaceholder.h
//  LMLNoNetPlaceholder
//
//  Created by 优谱德 on 16/7/19.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMLNoNetPlaceholder : UIView

@property (nonatomic, copy) NSString *placeholder_str;  // 网络连接失败   暂无数据

+ (void)showWithFrame:(CGRect)frame withView:(UIView *)view placeholderStr:(NSString *)placeholder;

+ (void)dismiss;

@end
