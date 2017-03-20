//
//  ClassDate.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "ClassDate.h"

@implementation ClassDate

- (id)initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        
        NSArray *arry = dic[@"result"];
        
        for (NSDictionary *DIC in arry) {
            
            Parent *parent = [[Parent alloc]initWithDictionary:DIC];
            
            [self.resultClassArr addObject:parent];
        }
        
    }
    return self;
}

- (NSMutableArray *)resultClassArr{
    if (!_resultClassArr) {
        _resultClassArr = [[NSMutableArray alloc]init];
    }
    return _resultClassArr;
}
@end
