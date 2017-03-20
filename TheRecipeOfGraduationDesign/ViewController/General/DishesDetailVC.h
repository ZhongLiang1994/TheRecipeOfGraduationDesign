//
//  DishesDetailVC.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/3.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol removeCollectDelegate <NSObject>

- (void)removeColletWith:(Dishes *)dishes;

@end

@interface DishesDetailVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)id<removeCollectDelegate>delegate;

@property (nonatomic ,strong)Dishes *dishes;

@property (nonatomic ,strong)NSMutableArray *dishesArr;

@property (nonatomic ,strong)UITableView *tableView;


@end
