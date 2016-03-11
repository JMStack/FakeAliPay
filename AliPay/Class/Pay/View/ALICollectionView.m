//
//  ALICollectionView.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALICollectionView.h"

#define kPerRowItemCount 4

@implementation ALICollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.minimumLineSpacing = 1;
    flowLayout.itemSize = CGSizeMake((ScreenWidth - (kPerRowItemCount - 1)) / kPerRowItemCount, ScreenWidth / kPerRowItemCount * 1.1f);
    ALICollectionView *collectionView = [super initWithFrame:frame collectionViewLayout: flowLayout];
    collectionView.backgroundColor = [UIColor colorWithRed:209/255.0 green:209/255.0 blue:209/255.0 alpha:1];
    collectionView.bounces = YES;
    return collectionView;
}

@end
