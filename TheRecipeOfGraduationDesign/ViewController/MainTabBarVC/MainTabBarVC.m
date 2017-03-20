//
//  MainTabBarVC.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/2.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "MainTabBarVC.h"
#import "HomeVC.h"
#import "CollectionVC.h"
#import "SettingVC.h"
#import "ClassificationVC.h"

@interface MainTabBarVC ()

@property (nonatomic ,strong)UINavigationController *homeNav;
@property (nonatomic ,strong)UINavigationController *collectionNav;
@property (nonatomic ,strong)UINavigationController *settingNav;

@property (nonatomic ,strong)UINavigationController *classificationNav;


@end

@implementation MainTabBarVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.viewControllers = @[self.homeNav,self.classificationNav,self.collectionNav,self.settingNav];
       
}

- (UINavigationController *)homeNav{
    if (!_homeNav) {
        _homeNav = [[UINavigationController alloc]init];
        
        HomeVC *homeVC = [[HomeVC alloc]init];
        
        homeVC.title = @"推荐";
        
        [self NavWith:_homeNav norImageName:@"" selImageName:@"" pushWithVC:homeVC titleWith:@"推荐"];
    }
    return _homeNav;
}

- (UINavigationController *)collectionNav{
    if (!_collectionNav) {
        _collectionNav = [[UINavigationController alloc]init];
        
        CollectionVC *collectionVC = [[CollectionVC alloc]init];
        
        collectionVC.title = @"收藏";
        
        [self NavWith:_collectionNav norImageName:@"" selImageName:@"" pushWithVC:collectionVC titleWith:@"收藏"];
        
    }
    return _collectionNav;
}

- (UINavigationController *)settingNav{
    if (!_settingNav) {
        _settingNav = [[UINavigationController alloc]init];
        
        SettingVC *settingVC = [[SettingVC alloc]init];
        
        settingVC.title = @"设置";
        
        [self NavWith:_settingNav norImageName:@"" selImageName:@"" pushWithVC:settingVC titleWith:@"设置"];
        
    }
    return _settingNav;
}

- (UINavigationController *)classificationNav{
    if (!_classificationNav) {
        _classificationNav = [[UINavigationController alloc]init];
        ClassificationVC *classificationVC = [[ClassificationVC alloc]init];
        classificationVC.title = @"分类";
        
        [self NavWith:_classificationNav norImageName:@"" selImageName:@"" pushWithVC:classificationVC titleWith:@"分类"];
        
    }
    return _classificationNav;
}

//tabbaritem的图片必须设置为UIImageRenderingModeAlwaysOriginal 否则会发生渲染错误
- (UIImage *)ImageName:(NSString *)name{
    
    UIImage *image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}

//设置tabbar上的主键图片
- (UINavigationController *)NavWith:(UINavigationController *)nav norImageName:(NSString *)norName selImageName:(NSString *)selName pushWithVC:(UIViewController *)vc titleWith:(NSString *)title{
    
    nav.tabBarItem.image = [self ImageName:norName];
    
    nav.tabBarItem.selectedImage = [self ImageName:selName];
    
    [nav pushViewController:vc animated:NO];
    
    nav.title = title;
    return nav;
}

@end
