//
//  HomeDishesCell.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDishesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dishesImageView;
@property (weak, nonatomic) IBOutlet UILabel *dishesNameLB;
@property (weak, nonatomic) IBOutlet UILabel *collectMark;

@end
