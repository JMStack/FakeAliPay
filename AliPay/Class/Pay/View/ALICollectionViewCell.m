//
//  ALICollectionViewCell.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALICollectionViewCell.h"
#import "ALIItemModel.h"

#define kDeleteIconMargin 8

@interface ALICollectionViewCell ()

@property (weak, nonatomic) UIButton *deleteButton;
@property (weak, nonatomic) UIImageView *iconView;
@property (weak, nonatomic) UILabel *iconLabel;

@end



@implementation ALICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.backgroundColor = [UIColor whiteColor];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        _iconView = iconView;
        [self.contentView addSubview:iconView];
        
        UILabel *iconLabel = [[UILabel alloc] init];
        iconLabel.font = [UIFont systemFontOfSize:12];
        iconLabel.textAlignment = NSTextAlignmentCenter;
        iconLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1];
        _iconLabel = iconLabel;
        [self.contentView addSubview:iconLabel];
        
        UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        deleteButton.backgroundColor = [UIColor whiteColor];
        [deleteButton setImage:[UIImage imageNamed:@"Home_delete_icon"] forState:UIControlStateNormal];
        [deleteButton sizeToFit];
        deleteButton.hidden = YES;
        [self.contentView addSubview:deleteButton];
        self.deleteButton = deleteButton;
        [deleteButton addTarget:self action:@selector(deleteButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setItemModel:(ALIItemModel *)itemModel {
    _itemModel = itemModel;
    
    self.iconView.image = [UIImage imageNamed:itemModel.icon];
    self.iconLabel.text = itemModel.title;
}

- (BOOL)hiddenDeleteButton {
    
    return self.deleteButton.hidden;
}

- (void)setHiddenDeleteButton:(BOOL)hiddenDeleteButton {
    
    self.deleteButton.hidden = hiddenDeleteButton;
}

- (void)deleteButtonTapped:(UIButton *)button {

    if ([self.delegate respondsToSelector:@selector(deleteCurrentCell)]) {
        [self.delegate deleteCurrentCell];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
            
    CGFloat h = self.contentView.heigth * 0.3f;
    CGFloat w = h;
    CGFloat x = (self.contentView.width - w) / 2;
    CGFloat y = self.contentView.heigth * 0.3;
    self.iconView.frame = CGRectMake(x, y, w, h);
    
    h = self.contentView.heigth * 0.3;
    w = self.contentView.width;
    x = 0;
    y = self.contentView.heigth * 0.6;
    self.iconLabel.frame = CGRectMake(x, y, w, h);

    CGRect rect = self.deleteButton.frame;
    rect.origin.x = self.contentView.width - rect.size.width - kDeleteIconMargin;
    rect.origin.y = kDeleteIconMargin;
    self.deleteButton.frame = rect;
}

@end
