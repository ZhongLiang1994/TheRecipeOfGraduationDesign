//
//  ResultDishesClass.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultDishesClass : NSObject
@property (nonatomic ,assign)int ID;

@property (nonatomic ,copy)NSString *name;

@property (nonatomic ,assign)int parentId;

- (id)initWithDictionary:(NSDictionary *)dic;
@end
