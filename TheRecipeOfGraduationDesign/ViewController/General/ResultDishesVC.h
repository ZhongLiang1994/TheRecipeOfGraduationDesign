//
//  ResultDishesVC.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeVC.h"
@interface ResultDishesVC : HomeVC<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic ,assign)int ID;
@property (nonatomic ,copy)NSString *searchName;
@property (nonatomic ,copy)NSString *name;
@end
