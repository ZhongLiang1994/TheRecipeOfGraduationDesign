//
//  ResultDishes.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "ResultDishes.h"

@implementation ResultDishes

- (id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        
        self.title = dic[@"title"];
        self.imtro = dic[@"imtro"];
        self.ingredients = dic[@"ingredients"];
        self.burden = dic[@"burden"];
        self.albums = dic[@"albums"][0];
        self.ID = [dic[@"id"] intValue];
        //获取收藏状态
       self.isCollect = [CollectVerify isCollectWithDishesID:self.ID];
        
        NSArray *steps = dic[@"steps"];
        
        for (NSDictionary *step in steps) {
            
            Steps *steps = [[Steps alloc]initWithDictionary:step];
            
            [self.stepsArr addObject:steps];
        }
        
    }
    return self;
}

- (NSMutableArray *)stepsArr{
    if (!_stepsArr) {
        _stepsArr = [[NSMutableArray alloc]init];
    }
    return _stepsArr;
}
@end
