//
//  ALICollectionViewCell.h
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALIItemModel;

@protocol ALICollectionViewCellDelegate <NSObject>

@optional
- (void)deleteCurrentCell;

@end

@interface ALICollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) ALIItemModel *itemModel;

@property (assign, nonatomic) BOOL hiddenDeleteButton;

@property (weak, nonatomic) id <ALICollectionViewCellDelegate> delegate;

@end
