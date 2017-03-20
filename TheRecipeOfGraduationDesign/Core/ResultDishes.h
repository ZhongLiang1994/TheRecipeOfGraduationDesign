//
//  ResultDishes.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultDishes : NSObject

@property (nonatomic ,assign)int ID;

//菜名
@property (nonatomic ,copy)NSString *title;

//菜的介绍
@property (nonatomic ,copy)NSString *imtro;

//菜的主材
@property (nonatomic ,copy)NSString *ingredients;

//菜的副材
@property (nonatomic ,copy)NSString *burden;

//预览图url
@property (nonatomic ,copy)NSString *albums;

//是否被收藏
@property (nonatomic ,assign) BOOL isCollect;

//制作步骤
@property (nonatomic ,strong)NSMutableArray *stepsArr;


- (id)initWithDictionary:(NSDictionary *)dic;

@end
