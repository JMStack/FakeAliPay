//
//  ALIPayViewController.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALIPayViewController.h"
#import "ALIHeaderView.h"
#import "ALICollectionView.h"
#import "ALIItemModel.h"
#import "ALICollectionViewCell.h"

#define kHeaderViewHeight 110
#define kTabBarHeight 44
#define kCell @"cell"

@interface ALIPayViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) UIView *headerView;
@property (weak, nonatomic) ALICollectionView *mainView;
@property (strong, nonatomic) NSMutableArray <ALIItemModel *> *itemArray;

@end

@implementation ALIPayViewController

- (NSMutableArray *)itemArray {
    if (_itemArray == nil) {
        _itemArray = [ALIItemModel itemModelArray];
    }
    return _itemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置头部
    ALIHeaderView *headerView = [[ALIHeaderView alloc] init];
    [self.view addSubview:headerView];
    self.headerView = headerView;
    
    //设置滚动主视图,注意:在这里self.view刚被加载完,其初始frame跟屏幕一样,还没有为navigationbar留出高度
    ALICollectionView *mainView = [[ALICollectionView alloc] initWithFrame:CGRectMake(0, kHeaderViewHeight, self.view.width, self.view.heigth - kHeaderViewHeight - kTabBarHeight)];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.itemModelArray = self.itemArray;
    [self.view addSubview:mainView];
    self.mainView = mainView;
    self.mainView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
   
    // 注册主视图cell
    [mainView registerClass:[ALICollectionViewCell class] forCellWithReuseIdentifier:kCell];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.headerView.frame = CGRectMake(0, 0, ScreenWidth, kHeaderViewHeight);
    //在这里self.view.frame已经重新被设置,留出了导航栏的高度,所以要重样的设置的一下mainView的高度
    self.mainView.frame = CGRectMake(0, kHeaderViewHeight, ScreenWidth, self.view.heigth - kHeaderViewHeight - kTabBarHeight);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource, UICollectionDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ALICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    cell.itemModel = self.itemArray[indexPath.row];
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    for (ALICollectionViewCell *cell in [self.mainView visibleCells]) {
        if (cell.hiddenDeleteButton == NO) {
            cell.hiddenDeleteButton = YES;
            //同时更新模形
            NSIndexPath *indexPath = [self.mainView indexPathForCell:cell];
            ALIItemModel *itemModel = self.itemArray[indexPath.item];
            itemModel.deleteIconHidden = YES;
            return;
        }
    }
    
    //如果没有删除按钮被显示则跳转
    UIViewController *viewControll = [[self.itemArray[indexPath.item].destinationController alloc] init];
    viewControll.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewControll animated:YES];
}

@end
