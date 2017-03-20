//
//  HomeVC.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UIViewController<UISearchControllerDelegate,UISearchResultsUpdating,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)NSMutableArray *dataArr;

@property (nonatomic ,strong)UITableView *tableView;

@property (nonatomic ,assign)BOOL isSuper;

@end
