//
//  ALICollectionViewCell.h
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALIItemModel;

@interface ALICollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) ALIItemModel *itemModel;

@property (assign, nonatomic) BOOL hiddenDeleteButton;

@end
