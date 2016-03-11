//
//  ALIItemModel.m
//  AliPay
//
//  Created by Jack.Ma on 16/3/9.
//  Copyright © 2016年 Jack.Ma. All rights reserved.
//

#import "ALIItemModel.h"

@implementation ALIItemModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.icon = [dict allValues].firstObject;
        self.title = [dict allKeys].firstObject;
    }
    return self;
}

+ (instancetype)itemModelWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

+ (NSMutableArray *)itemModelArray {
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mainViewItems" ofType:@"plist"]];
    for (NSDictionary *dict in array) {
        ALIItemModel *itemModel = [[ALIItemModel alloc] initWithDictionary:dict];
        [temp addObject:itemModel];
    }
    return temp;
}

@end
