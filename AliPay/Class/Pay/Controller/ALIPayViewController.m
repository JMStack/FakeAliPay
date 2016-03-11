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
#define kCell @"cell"

@interface ALIPayViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
≥
@property (weak, nonatomic) UIView *headerView;
@property (weak, nonatomic) UICollectionView *mainView;
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
    
    //设置滚动主视图
    ALICollectionView *mainView = [[ALICollectionView alloc] initWithFrame:CGRectMake(0, kHeaderViewHeight, self.view.width, self.view.heigth - kHeaderViewHeight - 44)];
    mainView.dataSource = self;
    mainView.delegate = self;
    [self.view addSubview:mainView];
    self.mainView = mainView;
    self.mainView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    // 注册主视图cell
    [mainView registerClass:[ALICollectionViewCell class] forCellWithReuseIdentifier:kCell];
//    [mainView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCell];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.headerView.frame = CGRectMake(0, 0, ScreenWidth, kHeaderViewHeight);
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
//    return ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ALICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    cell.itemModel = self.itemArray[indexPath.row];
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor purpleColor];

    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    NSLog(@"%@",NSStringFromCGSize([self.mainView.collectionViewLayout collectionViewContentSize]));
}
@end
