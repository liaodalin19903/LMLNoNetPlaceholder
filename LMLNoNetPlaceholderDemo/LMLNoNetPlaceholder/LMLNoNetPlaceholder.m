//
//  LMLNoNetPlaceholder.m
//  LMLNoNetPlaceholder
//
//  Created by 优谱德 on 16/7/19.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "LMLNoNetPlaceholder.h"

static LMLNoNetPlaceholder *holder = nil;

@interface LMLNoNetPlaceholder ()

@property (nonatomic, assign) CGRect initialFrame;  // 初始化的frame

//@property (nonatomic, strong)

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation LMLNoNetPlaceholder

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        _initialFrame = frame;
        
        [self initUI];
    }
    
    return self;
}

#pragma mark - init

- (void)initUI {

    /* 1.背景色为白色 */
    self.backgroundColor = [UIColor whiteColor];
    
    
    
    /* 2.图片 */
    [self addSubview:self.imageView];
    self.imageView.center = CGPointMake(_initialFrame.size.width / 2.0, _initialFrame.size.height / 2.0 - 50);
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.clipsToBounds = YES;
    
    /* 3.label */
    [self addSubview:self.label];
    self.label.center = CGPointMake(_initialFrame.size.width / 2.0, CGRectGetMaxY(self.imageView.frame) + 20);
    
}

#pragma mark - show and dismiss

+ (void)showWithFrame:(CGRect)frame withView:(UIView *)view placeholderStr:(NSString *)placeholder {

    
    CGRect rect = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    
    if (!holder){
        
        static dispatch_once_t predicate;
        
        dispatch_once(&predicate, ^{
            
            holder = [[LMLNoNetPlaceholder alloc] initWithFrame:rect];
            
            [holder addSubview:holder.imageView];
        });
    }
    
    
    
//    if (frame == CGRectZero) {
//        _initialFrame = frame;
//    }else
    
    holder.label.text = placeholder;
    
    [view addSubview:holder];
}

+ (void)dismiss {

    [holder removeFromSuperview];
}

#pragma mark - getter

- (UIImageView *)imageView {

    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _initialFrame.size.width / 3.0, _initialFrame.size.width / 3.0)];
        _imageView.image = [UIImage imageNamed:@"placeholder_nonet.png"];
        
    }
    return _imageView;
}

- (UILabel *)label {

    if (!_label ) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _initialFrame.size.width / 3.0, 20)];
        _label.textColor = [UIColor colorWithWhite:180.0/255.0 alpha:1.0];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
    }
    return _label;
}

@end
