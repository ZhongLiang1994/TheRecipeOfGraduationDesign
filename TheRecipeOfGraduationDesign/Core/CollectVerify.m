//
//  CollectVerify.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "CollectVerify.h"

@implementation CollectVerify
+ (BOOL)isCollectWithDishesID:(int)ID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 
    NSMutableArray *array = [defaults objectForKey:@"collectArr"];
    
    if (array == nil) {
        
        return NO;
    }
    
    NSString *dishesId = [NSString stringWithFormat:@"%d",ID];
   
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF == %@", dishesId];
    NSArray *results1 = [array filteredArrayUsingPredicate:predicate1];
    
    if (results1.count == 0) {
        
        return NO;
        
    }
    
    return YES;
}

+ (void)collectWithDishesID:(int)ID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //此处获得的数组为不可变数组 需要mutableCopy 不然插入不了数据
    NSMutableArray *array = [[defaults objectForKey:@"collectArr"] mutableCopy];
    if (!array) {
        array = [[NSMutableArray alloc]init];
    }

    NSString *IDStr = [NSString stringWithFormat:@"%d",ID];
    //匹配字符串，反回结果， SELF＝＝表示数组中每一个元素
    
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF == %@", IDStr];
    NSArray *results1 = [array filteredArrayUsingPredicate:predicate1];
    
    if (results1.count !=0) {
        return;
    }
    [array addObject:IDStr];
    
    [defaults setObject:array forKey:@"collectArr"];
}

+ (void)removeCollectWithDishesID:(int)ID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *array = [[defaults objectForKey:@"collectArr"] mutableCopy];
    
    
    NSString *dishesId = [NSString stringWithFormat:@"%d",ID];
    
    [array removeObject:dishesId];
    
     [defaults setObject:array forKey:@"collectArr"];
}

+ (NSMutableArray *)getCollectArr{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *array = [[defaults objectForKey:@"collectArr"] mutableCopy];
    
    return array;
}
@end
