//
//  Dishes.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Dishes : NSObject

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

//制作步骤
@property (nonatomic ,strong)NSMutableArray *stepsArr;

@property (nonatomic, assign) CGFloat imtroHeight;

@property (nonatomic, assign) CGFloat burdenHeight;

@property (nonatomic, assign) CGFloat ingredientsHeight;

@property (nonatomic, strong) NSMutableArray *stepHeightArr;

@property (nonatomic ,assign) BOOL isCollect;

@end
