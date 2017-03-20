//
//  CollectVerify.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectVerify : NSObject

//检测是否被收藏
+ (BOOL)isCollectWithDishesID:(int)ID;

//收藏
+ (void)collectWithDishesID:(int)ID;
//移除收藏
+ (void)removeCollectWithDishesID:(int)ID;

+ (NSMutableArray *)getCollectArr;
@end
