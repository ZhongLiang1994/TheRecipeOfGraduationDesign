//
//  Parent.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parent : NSObject

@property (nonatomic ,copy)NSString *parentName;
@property (nonatomic ,strong)NSMutableArray *resultParentArr;
- (id)initWithDictionary:(NSDictionary *)dic;
@end
