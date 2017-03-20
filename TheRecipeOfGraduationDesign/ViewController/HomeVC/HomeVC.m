//
//  HomeVC.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "HomeVC.h"
#import "resoutVC.h"
#import "HomeDishesCell.h"
@interface HomeVC ()<getJsonDelegate,removeCollectDelegate>
{
    MBProgressHUD *HUD;
}
@property (nonatomic ,strong)UISearchController *searchController;

@end

@implementation HomeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.searchController.searchBar.delegate = self;
    
    self.isSuper = YES;
 }

- (void)viewWillAppear:(BOOL)animated{
    
    self.tableView.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT-49);
    [super viewWillAppear:YES];
    
    if (self.isSuper == YES) {
        
        [self.view addSubview:self.tableView];
        
        HUD = [[MBProgressHUD alloc]initWithView:self.view];
        
        [self.view addSubview:HUD];
        
        [HUD showAnimated:YES];
        
    if (self.dataArr.count != 0) {
        return;
    }
   
    for (int i = 0; i<1; i++) {
        
        int ID = arc4random()%1000;
        
        NSString *a = [NSString stringWithFormat:@"%d",ID];
    
        NETMANGERDELEGATE
        [NETMANGER GetJSONData:a];
        
    }
    
        //进入刷新状态
    [self.tableView.mj_header beginRefreshing];
        
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopic)];
    }
}



- (void)loadMoreTopic{
    
    for (int i = 0; i<3; i++) {
        
        int ID = arc4random()%1000;
        
        NSString *a = [NSString stringWithFormat:@"%d",ID];

        [NETMANGER GetJSONData:a];
    }
    
      [self.tableView.mj_footer endRefreshing];
}

- (void)getJsonDataWith:(Dishes *)dishes :(NSArray *)array{
    
    
    [self.dataArr addObject:dishes];
    
    [self.tableView reloadData];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
     [HUD hideAnimated:YES];
    [super viewDidAppear:YES];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    HomeDishesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Dishes *dishes = _dataArr[indexPath.row];
 
    cell.dishesNameLB.text = dishes.title;
    
    if (dishes.isCollect == YES) {
        cell.collectMark.alpha = 1;
    }else{
        cell.collectMark.alpha = 0;
    }
    
   
    [cell.dishesImageView sd_setImageWithURL:[NSURL URLWithString:dishes.albums]];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DishesDetailVC *vc = [[DishesDetailVC alloc]init];
    
    vc.delegate = self;
    
    vc.dishes = _dataArr[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (void)removeColletWith:(Dishes *)dishes{
    
}


#pragma mark - 懒加载

- (UISearchController *)searchController{
    if (!_searchController) {
        

        
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        
        _searchController.searchResultsUpdater = self;  //设置UISearchResultsUpdating协议代理
        
        _searchController.delegate = self;        //设置UISearchControllerDelegate协议代理
        
        _searchController.hidesNavigationBarDuringPresentation = YES;
        
        _searchController.dimsBackgroundDuringPresentation = YES;//是否添加半透明覆盖层
        
        _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,self.searchController.searchBar.frame.origin.y,self.searchController.searchBar.frame.size.width,44);
        
        _searchController.searchBar.placeholder = @"请输入菜名或者食材名称";
        
        _searchController.hidesNavigationBarDuringPresentation = YES;     //是否隐藏导航栏
    
    }
    return _searchController;
}

- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"HomeDishesCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}


- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    if (searchBar.text.length == 0) {
        return;
    }

    ResultDishesVC *resultDishesVC = [[ResultDishesVC alloc]init];

    [self.navigationController pushViewController:resultDishesVC animated:YES];
    
    resultDishesVC.searchName = searchBar.text;
    
    for (id obj in [searchBar subviews]) {
        if ([obj isKindOfClass:[UIView class]]) {
            for (id obj2 in [obj subviews]) {
                if ([obj2 isKindOfClass:[UIButton class]]) {
                    UIButton *btn = (UIButton *)obj2;
                    [btn sendActionsForControlEvents:UIControlEventTouchUpInside];
                }
            }
        }
    }
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
