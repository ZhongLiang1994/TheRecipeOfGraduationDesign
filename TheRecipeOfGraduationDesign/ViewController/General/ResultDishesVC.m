//
//  ResultDishesVC.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "ResultDishesVC.h"
#import "HomeDishesCell.h"
@interface ResultDishesVC ()<getJsonDelegate>
{
    NSString *_dishesName;
    int _classID;
    BOOL _isSearch;
}

@property (nonatomic ,strong)UILabel *headerLable;
@property (nonatomic ,assign)int i;
@property (nonatomic ,assign)int a;


@end

@implementation ResultDishesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataArr removeAllObjects];
    
    self.tableView.tableHeaderView = self.headerLable;
    
  
    
    [self.view addSubview:self.tableView];
   
    NETMANGERDELEGATE;
    //上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopic)];
   
}

- (void)loadMoreTopic{
    
    if (_isSearch == YES) {
        
       
        _i +=10;
        
        [NETMANGER GetJSONDataWithName:_dishesName :_i];
    }else{
        
        _a +=10;
    
        [NETMANGER GetJSONDataWithClass:_classID :_a];
        
    }
    //结束尾部刷新
    [self.tableView.mj_footer endRefreshing];
}

- (void)setName:(NSString *)name{
    
    self.title = name;
}

- (void)setSearchName:(NSString *)searchName{
    
    self.title = [NSString stringWithFormat:@"'%@' 的搜索结果",searchName];
    
    _isSearch = YES;
    
    _dishesName = searchName;
    
    _i = 1;
    [NETMANGER GetJSONDataWithName:searchName :_i];
}

- (void)getJsonDataWith:(Dishes *)dishes :(NSArray *)array{

    [self.dataArr addObjectsFromArray:array];
    
    if (array.count == 0) {
        [self searchError];
        return;
    }
    [self.tableView reloadData];
  
}
- (void)setID:(int)ID{
    
    _isSearch = NO;
    
    _classID = ID;
    
    _a = 1;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [NETMANGER GetJSONDataWithClass:ID :_a];
        
    });

}

//搜索出错的方法
- (void)searchError{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"没有找到这样的菜" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    [self.navigationController popViewControllerAnimated:YES];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (UILabel *)headerLable{
    if (!_headerLable) {
        _headerLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 0,SCREEN_WIDTH-10, CGFLOAT_MIN)];
    }
    return _headerLable;
}
@end
