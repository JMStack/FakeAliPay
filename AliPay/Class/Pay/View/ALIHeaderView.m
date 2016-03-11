//
//  ALIHeaderView.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALIHeaderView.h" 

@interface ALIHeaderView ()
@property (weak, nonatomic) UIButton *rightButton;
@property (weak, nonatomic) UIButton *leftButton;
@end

@implementation ALIHeaderView

- (instancetype)init {
    if (self = [super init]) {
       // [self setUpSubButton];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpSubButton];
    }
    return self;
}

- (void) setUpSubButton {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"home_scan"] forState:UIControlStateNormal];
    leftButton.contentMode = UIViewContentModeScaleAspectFit;
    leftButton.backgroundColor = [UIColor colorWithRed:34/255.0 green:37/255.0 blue:55/255.0 alpha:1];
    [leftButton addTarget:self action:@selector(scanButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftButton];
    self.leftButton = leftButton;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"home_pay"] forState:UIControlStateNormal];
    rightButton.contentMode = UIViewContentModeScaleAspectFit;
    rightButton.backgroundColor = [UIColor colorWithRed:34/255.0 green:37/255.0 blue:55/255.0 alpha:1];
    [rightButton addTarget:self action:@selector(payButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightButton];
    self.rightButton = rightButton;
}

- (void)payButtonTapped:(UIButton *)button {
   NSLog(@"%s",__func__);
}

- (void)scanButtonTapped:(UIButton *)button {
     NSLog(@"%s",__func__);
}

- (void)layoutSubviews {
    [super  layoutSubviews];
    
    self.leftButton.frame = CGRectMake(0, 0, self.frame.size.width * 0.5, self.frame.size.height);
    self.rightButton.frame = CGRectMake(self.leftButton.frame.size.width, 0, self.frame.size.width * 0.5, self.frame.size.height);    
}

@end
