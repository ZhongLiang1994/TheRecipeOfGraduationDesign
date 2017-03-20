//
//  Steps.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/3.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "Steps.h"

@implementation Steps

- (id)initWithDictionary:(NSDictionary *)dic{
    if (self) {
        
        self.img = dic[@"img"];
        self.step = dic[@"step"];
        
        self.height = [self getAutoHeightWith:SCREEN_WIDTH-80 :200 :15 ofString:self.step];
    }
    return self;
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
