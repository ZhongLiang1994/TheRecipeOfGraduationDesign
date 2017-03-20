//
//  ClassificationVC.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/4.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "ClassificationVC.h"
#import "TableViewCell.h"

@interface ClassificationVC ()<UITableViewDelegate,UITableViewDataSource>
{
    MBProgressHUD *HUD;
}
//左列表
@property (nonatomic, strong) UITableView *leftTableView;
//右列表
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic ,strong) NSMutableArray *classArr;

@property (nonatomic ,strong) NSMutableArray *paretArr;

@end

@implementation ClassificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    if (self.dataArr.count != 0) {
        return;
    }
    
    
    HUD = [[MBProgressHUD alloc]initWithView:self.view];
    
    [self.view addSubview:HUD];
    
    [HUD showAnimated:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        [NETMANGER GetJSONClassData:^(NSArray *array,NSArray *parentArr) {
            
            [self.view addSubview:self.leftTableView];
            
            [self.view addSubview:self.rightTableView];
            
            [self.dataArr addObjectsFromArray:array];
            
            self.classArr = _dataArr.firstObject;
            
            [self.paretArr addObjectsFromArray:parentArr];
            
            [HUD hideAnimated:YES];
            
        }];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _leftTableView)
    {
        return _paretArr.count;
    }else
    {
        return _classArr.count;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(tableView == self.leftTableView)
    {
        return 1;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if(tableView == self.leftTableView)
    {
        TableViewCell *cell;
        
        cell = [tableView cellForRowAtIndexPath:indexPath];

        if (!cell) {
            cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftTableView"];
        }
        
        if (indexPath.row == 0) {
            
            [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        Parent *parent = _paretArr[indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"- %@ -",parent.parentName];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
        
    }else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightTableViewCell" forIndexPath:indexPath];
        
        DishesClass *dishesClass = _classArr[indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",dishesClass.name];
       cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    if(tableView == self.leftTableView)
    {
        _classArr = _dataArr[indexPath.row];
        
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:[tableView cellForRowAtIndexPath:indexPath] cache:YES];

        
        [self.rightTableView reloadData];
    }else{
        
        DishesClass *dishesClass = _classArr[indexPath.row];
        
        ResultDishesVC *resultDishesVC = [[ResultDishesVC alloc]init];
        
        resultDishesVC.name = dishesClass.name;
        resultDishesVC.ID = dishesClass.ID;
        [self.navigationController pushViewController:resultDishesVC animated:YES];
    }
     [UIView commitAnimations];
}



#pragma mark - 懒加载

- (UITableView *)leftTableView
{
    if(_leftTableView == nil)
    {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH*0.4, SCREEN_HEIGHT-64-49)];
        _leftTableView.delegate = self;
        
        _leftTableView.dataSource = self;
        
        _leftTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _leftTableView.separatorColor = [UIColor orangeColor];
        
        [_leftTableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"leftTableView"];
        _leftTableView.tableFooterView = [[UIView alloc]init];
        
    }
    return _leftTableView;
}
- (UITableView *)rightTableView
{
    if(_rightTableView == nil)
    {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.4,64, SCREEN_WIDTH*0.6, SCREEN_HEIGHT-64-49)];
        _rightTableView.delegate= self;
        _rightTableView.dataSource = self;
        
        _rightTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [_rightTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"rightTableViewCell"];
        _rightTableView.tableFooterView = [[UIView alloc]init];
    }
    return _rightTableView;
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (NSMutableArray *)classArr{
    if (!_classArr) {
        _classArr = [[NSMutableArray alloc]init];
    }
    return _classArr;
}

- (NSMutableArray *)paretArr{
    if (!_paretArr) {
        _paretArr = [[NSMutableArray alloc]init];
    }
    return _paretArr;
}

@end
