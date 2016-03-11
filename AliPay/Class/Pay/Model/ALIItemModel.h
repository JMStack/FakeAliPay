//
//  ALIItemModel.h
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALIItemModel : NSObject

@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic ,getter=isDeleteIconHidden) BOOL deleteIconHidden;
@property (assign, nonatomic) Class destinationController;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)itemModelWithDictionary:(NSDictionary *)dict;
+ (NSMutableArray *)itemModelArray;

@end
