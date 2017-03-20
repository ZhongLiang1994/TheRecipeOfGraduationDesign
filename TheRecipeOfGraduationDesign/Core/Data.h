//
//  Data.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
@property (nonatomic ,strong)NSMutableArray *resultDishesArr;

- (id)initWithDictionary:(NSDictionary *)dic;
@end
