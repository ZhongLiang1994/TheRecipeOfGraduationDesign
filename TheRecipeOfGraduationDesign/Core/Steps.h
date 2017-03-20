//
//  Steps.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/3.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Steps : NSObject

//步骤图片
@property (nonatomic ,copy)NSString *img;

//步骤说明
@property (nonatomic ,copy)NSString *step;

@property (nonatomic ,assign)CGFloat height;


- (id)initWithDictionary:(NSDictionary *)dic;
@end
