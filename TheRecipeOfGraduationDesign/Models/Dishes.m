//
//  Dishes.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "Dishes.h"

@implementation Dishes


- (CGFloat)imtroHeight {
    if (!_imtroHeight) {
        _imtroHeight = [self getAutoHeightWith:SCREEN_WIDTH-30 :200 :15 ofString:self.imtro];
    }
    
    return _imtroHeight;
}

- (CGFloat)burdenHeight {
    if (!_burdenHeight) {
        _burdenHeight = [self getAutoHeightWith:SCREEN_WIDTH-30 :200 :15 ofString:self.burden];
    }
    return _burdenHeight;
}

- (CGFloat)ingredientsHeight {
    if (!_ingredientsHeight) {
       _ingredientsHeight = [self getAutoHeightWith:SCREEN_WIDTH-30 :200 :15 ofString:self.ingredients];
    }
    return _ingredientsHeight;
}



- (CGFloat)getAutoHeightWith:(CGFloat)width :(CGFloat)height :(CGFloat )font ofString:(NSString *)str{
    
    CGFloat autoHeight;
    
    autoHeight = [str boundingRectWithSize:CGSizeMake(width, height)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]}
                                                context:nil].size.height;
    return autoHeight;
}
@end
