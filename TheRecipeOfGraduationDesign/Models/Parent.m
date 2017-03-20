//
//  Parent.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "Parent.h"

@implementation Parent
- (id)initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        
        self.parentName = dic[@"name"];
        NSArray *arry = dic[@"list"];
        
        
        for (NSDictionary *DIC in arry) {
            
            ResultDishesClass *parentClass = [[ResultDishesClass alloc]initWithDictionary:DIC];
            
            [self.resultParentArr addObject:parentClass];
        }
        
    }
    return self;
}

- (NSMutableArray *)resultParentArr{
    if (!_resultParentArr) {
        _resultParentArr = [[NSMutableArray alloc]init];
    }
    return _resultParentArr;
}
@end
