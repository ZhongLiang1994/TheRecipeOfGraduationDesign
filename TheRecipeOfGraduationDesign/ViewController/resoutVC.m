//
//  resoutVC.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "resoutVC.h"

@interface resoutVC ()

@end

@implementation resoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.backgroundColor = [UIColor yellowColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RESULT_CELL"];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"RESULT_CELL"];
    }
    
    cell.textLabel.text =  self.dataArr[indexPath.row];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;

}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
        
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
