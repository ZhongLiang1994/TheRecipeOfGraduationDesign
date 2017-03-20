//
//  Data.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "Data.h"

@implementation Data


- (id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        NSString *reultcode = dic[@"resultcode"];
        
        if (![reultcode isEqualToString:@"202"]) {
            
            NSDictionary *result = dic[@"result"];
            NSArray *data = result[@"data"];
            
            for (NSDictionary *dishes in data) {
                
                ResultDishes *resultDishes = [[ResultDishes alloc]initWithDictionary:dishes];
                [self.resultDishesArr addObject:resultDishes];
            }
        }
    }
    return self;
}

- (NSMutableArray *)resultDishesArr{
    if (!_resultDishesArr) {
        _resultDishesArr = [[NSMutableArray alloc]init];
    }
    return _resultDishesArr;
}

@end
