//
//  ALICollectionViewCell.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALICollectionViewCell.h"
#import "ALIIconButton.h"
#import "ALIItemModel.h"

#define kDeleteIconMargin 8

@interface ALICollectionViewCell ()

@property (weak, nonatomic) ALIIconButton *iconButton;
@property (weak, nonatomic) UIButton *deleteButton;
@end

@implementation ALICollectionViewCell

- (void)setItemModel:(ALIItemModel *)itemModel {
    _itemModel = itemModel;
    
    ALIIconButton *iconButton = [ALIIconButton buttonWithType:UIButtonTypeCustom];
    iconButton.backgroundColor = [UIColor whiteColor];
    [iconButton setImage:[UIImage imageNamed:itemModel.icon] forState:UIControlStateNormal];
    [iconButton setTitle:itemModel.title forState:UIControlStateNormal];
    iconButton.titleLabel.font = [UIFont systemFontOfSize:12];
    iconButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [iconButton setTitleColor:[UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1] forState:UIControlStateNormal];
    [self.contentView addSubview:iconButton];
    self.iconButton = iconButton;
    iconButton.enabled = YES;
    [iconButton addTarget:self action:@selector(iconButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.backgroundColor = [UIColor whiteColor];
    [deleteButton setImage:[UIImage imageNamed:@"Home_delete_icon"] forState:UIControlStateNormal];
    [deleteButton sizeToFit];
    deleteButton.hidden = NO;
    [self.contentView addSubview:deleteButton];
    self.deleteButton = deleteButton;
    [iconButton addTarget:self action:@selector(deleteButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (BOOL)hiddenDeleteButton {
    
    return self.deleteButton.hidden;
}

- (void)setHiddenDeleteButton:(BOOL)hiddenDeleteButton {
    
    self.deleteButton.hidden = hiddenDeleteButton;
}


- (void)iconButtonTapped:(UIButton *)button {
    NSLog(@"%s",__func__);
}

- (void)deleteButtonTapped:(UIButton *)button {
     NSLog(@"%s",__func__);
    NSLog(@"%@",NSStringFromCGRect(self.deleteButton.frame));
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconButton.frame = self.contentView.bounds;
    CGRect rect = self.deleteButton.frame;
    rect.origin.x = self.contentView.width - rect.size.width - kDeleteIconMargin;
    rect.origin.y = kDeleteIconMargin;
    self.deleteButton.frame = rect;
}

@end
