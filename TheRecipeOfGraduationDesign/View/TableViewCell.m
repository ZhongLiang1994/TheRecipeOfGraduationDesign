//
//  TableViewCell.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/5.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
   
    if (selected) {
        self.textLabel.textColor = [UIColor orangeColor];
        
    }else{
        self.textLabel.textColor = [UIColor blackColor];
    }
   
    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    
    
}

@end
