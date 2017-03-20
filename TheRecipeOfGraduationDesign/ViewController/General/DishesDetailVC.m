//
//  DishesDetailVC.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/3.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "DishesDetailVC.h"
#import "DishesStepCell.h"
#import "DishesHeaderCell.h"
#import "DishesMaterialCell.h"


@interface DishesDetailVC ()

@end

@implementation DishesDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(CollectClick)];
    
    
    if (_dishes.isCollect == YES) {
        self.navigationItem.rightBarButtonItem.title = @"取消收藏";
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor darkGrayColor];
        
    }
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
            case 1:
            return 1;
            
        default:
            return self.dishes.stepsArr.count;
            break;
    }
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
        {
            DishesHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell" forIndexPath:indexPath];
            
            [cell.dishesImageView sd_setImageWithURL:[NSURL URLWithString:self.dishes.albums]];
            
            cell.imtroLB.text = self.dishes.imtro;
            
            return cell;
        }
            break;
            case 1:
        {
            DishesMaterialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"materialCell" forIndexPath:indexPath];
            
            cell.ingredientsLB.text = self.dishes.ingredients;
            cell.burdenLB.text = self.dishes.burden;
            
            return cell;
        }
            break;
            case 2:
        {
            DishesStepCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stepCell" forIndexPath:indexPath];
            
            Steps *step = self.dishes.stepsArr[indexPath.row];
            
            [cell.img sd_setImageWithURL:[NSURL URLWithString:step.img]];
            cell.step.text = step.step;
            

            return cell;
        }
        default:
            break;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return 200 +_dishes.imtroHeight-20;
            break;
            case 1:
            return 100 + _dishes.burdenHeight-20 +_dishes.ingredientsHeight-20;
            break;
            case 2:
        {
            Steps *step = _dishes.stepsArr[indexPath.row];
            
            if (step.height > 70) {
               return step.height+40;
            }
            return 100;
        }
            
            break;
            
        default:
            break;
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}


//将收藏的id存储到本地
- (void)CollectClick{
    
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"收藏"]) {
        
        [CollectVerify collectWithDishesID:_dishes.ID];
        
        _dishes.isCollect = YES;
        
        self.navigationItem.rightBarButtonItem.title = @"取消收藏";
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor darkGrayColor];
    }else{
        
        [CollectVerify removeCollectWithDishesID:_dishes.ID];
        
        _dishes.isCollect = NO;
        
        [self.delegate removeColletWith:self.dishes];
        
        self.navigationItem.rightBarButtonItem.title = @"收藏";
        
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor blueColor];
    }
    
    
    
}
#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"DishesHeaderCell" bundle:nil] forCellReuseIdentifier:@"headerCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"DishesMaterialCell" bundle:nil] forCellReuseIdentifier:@"materialCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"DishesStepCell" bundle:nil] forCellReuseIdentifier:@"stepCell"];
    }
    return _tableView;
}

- (NSMutableArray *)dishesArr{
    if (!_dishesArr) {
        _dishesArr = [[NSMutableArray alloc]init];
    }
    return _dishesArr;
}

@end
