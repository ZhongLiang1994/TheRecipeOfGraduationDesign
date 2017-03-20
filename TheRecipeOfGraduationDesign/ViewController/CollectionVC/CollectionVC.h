//
//  CollectionVC.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionVC :HomeVC<UITableViewDelegate,UITableViewDataSource,getJsonDelegate>



@property (nonatomic ,strong)NSMutableArray *IDArr;

@end
