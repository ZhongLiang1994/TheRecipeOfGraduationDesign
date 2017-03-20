//
//  ClassDate.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassDate : NSObject

@property (nonatomic ,strong)NSMutableArray *resultClassArr;

- (id)initWithDictionary:(NSDictionary *)dic;
@end
