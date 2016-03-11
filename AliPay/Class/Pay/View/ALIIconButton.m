//
//  ALIIconButton.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALIIconButton.h"

@implementation ALIIconButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat h = self.frame.size.height * 0.3;
    CGFloat w = h;
    CGFloat x = (self.frame.size.width- w) * 0.5;
    CGFloat y = self.frame.size.height * 0.3;
    return CGRectMake(x, y, w, h);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, self.frame.size.height * 0.6, self.frame.size.width, self.frame.size.height * 0.3);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

@end
