//
//  ALICollectionView.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALICollectionView.h"
#import "ALICollectionViewCell.h"
#import "ALIItemModel.h"

@interface ALICollectionView () <ALICollectionViewCellDelegate>

@property (weak, nonatomic) UIImageView *fakeCellImage;
@property (strong, nonatomic) NSIndexPath *selectedCell;
@property (weak, nonatomic) UIView *coverView;

@end

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
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(mainViewLongPressed:)];
    [collectionView addGestureRecognizer:gesture];

    return collectionView; 
}

- (void)mainViewLongPressed:(UILongPressGestureRecognizer *)gesture {
    
    CGPoint point = [gesture locationInView:self];
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        //隐藏之前出现过的删除按钮
        ALICollectionViewCell *preCll = (ALICollectionViewCell *)[self cellForItemAtIndexPath:self.selectedCell];
        preCll.hiddenDeleteButton = YES;
        ALIItemModel *item = self.itemModelArray[self.selectedCell.item];
        item.deleteIconHidden = YES;
        
        NSIndexPath *index = [self indexPathForItemAtPoint:point];
        self.selectedCell = index;
        ALICollectionViewCell *cell = (ALICollectionViewCell *)[self cellForItemAtIndexPath:index];
        //改变cell的删除button同时要更新模形,不然会有重用问题
        cell.hiddenDeleteButton = NO;
        item = self.itemModelArray[index.item];
        item.deleteIconHidden = NO;
//        cell.layer.transform = CATransform3DMakeScale(1.1, 1.1, 0);
//        CABasicAnimation *animation = [CABasicAnimation animation];
//        animation.keyPath = @"transform.scale";
//        animation.toValue = @1.1;
//        animation.removedOnCompletion = NO;
//        animation.fillMode = @"forwards";
//        animation.duration = 0.2;
//        [cell.layer addAnimation:animation forKey:nil];

        [UIView animateWithDuration:0.2 animations:^{
            cell.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished){
            UIGraphicsBeginImageContext(cell.contentView.bounds.size);
            [cell.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *cellImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            cell.transform = CGAffineTransformIdentity;
            
            UIImageView *fakeCell = [[UIImageView alloc] initWithImage:cellImage];
            fakeCell.center = cell.center;
            fakeCell.bounds = CGRectMake(0, 0, cell.width * 1.1, cell.heigth * 1.1);
            fakeCell.contentMode = UIViewContentModeScaleAspectFill;
            [cell.superview addSubview:fakeCell];
            self.fakeCellImage = fakeCell;
            
            UIView *coverView = [[UIView alloc] initWithFrame:cell.bounds];
            coverView.backgroundColor = [UIColor whiteColor];
            [cell addSubview:coverView];
            self.coverView = coverView;
        }];
        
        for (ALICollectionViewCell *cell in [self visibleCells]) {
            //为当前可视的cell设置代理
            cell.delegate = self;
        }
        return;
    }
    
    if (gesture.state == UIGestureRecognizerStateChanged) {
        //移动假的cell
        self.fakeCellImage.center = point;
        //当前手指在哪个item上
        NSIndexPath *indexpath = [self indexPathForItemAtPoint:point];
        if (self.selectedCell != indexpath) {
            //交换模形
            [self.itemModelArray exchangeObjectAtIndex:self.selectedCell.item withObjectAtIndex:indexpath.item];
            //移动cell
            [self moveItemAtIndexPath:self.selectedCell toIndexPath:indexpath];
            
            self.selectedCell = indexpath;
        }
        return;
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        //手指离开屏幕
        [self.coverView removeFromSuperview];
        [self.fakeCellImage removeFromSuperview];
        return;
    }
    
}

- (void)deleteCurrentCell {
    [self.itemModelArray removeObjectAtIndex:self.selectedCell.item];
    [self deleteItemsAtIndexPaths:[NSArray arrayWithObject:self.selectedCell]];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    [self.collectionView moveItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] toIndexPath:[NSIndexPath indexPathForItem:5 inSection:0]];
//}

@end
