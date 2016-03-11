//
//  ALITabBarController.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALITabBarController.h"
#import "ALINavigationController.h"
#import "ALIPayViewController.h"
#import "ALIAssetTableViewController.h"
#import "ALIDiscoveryViewController.h"
#import "ALIServiceTableViewController.h"


@interface ALITabBarController ()

@end

@implementation ALITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加四个导航控制器
    [self addAllNavigationController];
    
}

- (void)addAllNavigationController {
    
    [self addOneNavigationControllerWithRootController:[ALIPayViewController class] title:@"支付宝" tabBarImage:[UIImage imageNamed:@"TabBar_HomeBar"] andSelectedImage:[UIImage imageNamed:@"TabBar_HomeBar_Sel"]];
   [self addOneNavigationControllerWithRootController:[ALIServiceTableViewController class] title:@"服务窗" tabBarImage:[UIImage imageNamed:@"TabBar_PublicService"] andSelectedImage:[UIImage imageNamed:@"TabBar_PublicService_Sel"]];
    [self addOneNavigationControllerWithRootController:[ALIDiscoveryViewController class] title:@"发现" tabBarImage:[UIImage imageNamed:@"TabBar_Discovery"] andSelectedImage:[UIImage imageNamed:@"TabBar_Discovery_Sel"]];
    [self addOneNavigationControllerWithRootController:[ALIAssetTableViewController class] title:@"财富" tabBarImage:[UIImage imageNamed:@"TabBar_Assets"] andSelectedImage:[UIImage imageNamed:@"TabBar_Assets_Sel"]];
}

- (void)addOneNavigationControllerWithRootController:(Class)class title:(NSString *)title tabBarImage:(UIImage *)imageName andSelectedImage:(UIImage *)selectImage{
    
    UIViewController *rootViewController = [[class alloc] init];
    ALINavigationController *aliNavigationController = [[ALINavigationController alloc] initWithRootViewController:rootViewController];
    rootViewController.title = title;
    aliNavigationController.tabBarItem.image = imageName;
    aliNavigationController.tabBarItem.selectedImage = selectImage;
    [self addChildViewController:aliNavigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
