

//
//  CollectionVC.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "CollectionVC.h"

@implementation CollectionVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.isSuper = NO;
    
    self.tableView.tableHeaderView = nil;
    //清除父类数据源数组中的数据
    [self.dataArr removeAllObjects];
    
    [self.view addSubview:self.tableView];
   }

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //处理收藏变更
    //新的数据
    NSMutableArray *newArr = [CollectVerify getCollectArr];
    //旧的数据
    NSMutableArray *oldArr = [[NSMutableArray alloc]init];
    
    //获取原来数据的所有id
    for (Dishes *dishes in self.dataArr) {
        [oldArr addObject:[NSString stringWithFormat:@"%d",dishes.ID]];
    }
    
    //转化为set进行比较
    NSMutableSet *newSet = [NSMutableSet setWithArray:newArr];
    NSMutableSet *oldSet = [NSMutableSet setWithArray:oldArr];
    
    //取差集
    [newSet minusSet:oldSet];
    
    if (newSet.count == 0) {
        return;
    }
    
    //当存在差集时将差集内id请求数据加入数据源数组并刷新
    NETMANGERDELEGATE
    
    for (NSString *iD in newSet) {
        
        [NETMANGER GetJSONData:iD];
        
    }

}
//选择你要对表进行处理的方式  默认是删除方式

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
        //当表视图处于没有未编辑状态时选择左滑删除
        return UITableViewCellEditingStyleDelete;

}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
    
}


//选择编辑的方式,按照选择的方式对表进行处理

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {//删除
       
        Dishes *dishes = self.dataArr[indexPath.row];
        
        [CollectVerify removeCollectWithDishesID:dishes.ID];
        
        dishes.isCollect = NO;
        
        
        [self.dataArr removeObjectAtIndex:indexPath.section];
        
        [self.tableView reloadData];
        
    }else{
        NSLog(@"选择了");
    }
    
}

- (void)removeColletWith:(Dishes *)dishes{

    [self.dataArr removeObject:dishes];
    [self.tableView reloadData];
}

- (void)getJsonDataWith:(Dishes *)dishes :(NSArray *)array{
    
    [self.dataArr addObject:dishes];
    
    [self.tableView reloadData];
}
@end
