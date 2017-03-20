//
//  ResultDishesClass.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "ResultDishesClass.h"

@implementation ResultDishesClass
- (id)initWithDictionary:(NSDictionary *)dic{
    if (self) {
        
        self.ID = [dic[@"id"] intValue];
        self.name = dic[@"name"];
        self.parentId = [dic[@"parentId"] intValue];
      
    }
    return self;
}
@end
