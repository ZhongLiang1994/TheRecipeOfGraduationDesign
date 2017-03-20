//
//  NetworkingDataSource.m
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/3.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import "NetworkingDataSource.h"
#import "AFNetWorking.h"

@implementation NetworkingDataSource
static NetworkingDataSource *_DS = nil;

//工具类单利化
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (_DS == nil) {
            _DS = [super allocWithZone:zone];
        }
    }
    return _DS;
}
+ (instancetype)sharedInstance
{
    @synchronized(self) {
        if (_DS == nil) {
            _DS = [[self alloc] init];
        }
    }
    return _DS;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _DS;
}

//根据菜品id请求数据
- (void)GetJSONData:(NSString *)ID{
 
    
    NSString *urlstring = [NSString stringWithFormat:@"http://apis.juhe.cn/cook/queryid?key=ea87a5eab29c700950682befcd7c99fc&id=%@",ID];
    
    urlstring = [urlstring stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        
        NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"\n%@",string);
       
        Data *base = [[Data alloc]initWithDictionary:responseObject];
        
            
            ResultDishes *resultDishes = base.resultDishesArr.firstObject;
            
            Dishes *dishes = [[Dishes alloc]init];
            
            dishes.title = resultDishes.title;
            dishes.albums = resultDishes.albums;
            dishes.ingredients = resultDishes.ingredients;
            dishes.imtro = resultDishes.imtro;
            dishes.burden = resultDishes.burden;
            dishes.stepsArr = resultDishes.stepsArr;
            dishes.ID = resultDishes.ID;
            dishes.isCollect = resultDishes.isCollect;
        
        //将数组传回去
        [self.delegate getJsonDataWith:dishes:nil];
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求错误：%@",error);
        return ;
    }];
}


//请求到所有的类别
- (void)GetJSONClassData:(void(^)(NSArray *array,NSArray *parentArr))block{
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    ;
    
    NSMutableArray *parentArray = [[NSMutableArray alloc]init];
    ;
    
    NSString *urlstring = [NSString stringWithFormat:@"http://apis.juhe.cn/cook/category?key=ea87a5eab29c700950682befcd7c99fc"];
    
    urlstring = [urlstring stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        
        ClassDate *classBase = [[ClassDate alloc]initWithDictionary:responseObject];
        for (int i = 0; i<classBase.resultClassArr.count; i++) {
            
            NSMutableArray *classArray = [[NSMutableArray alloc]init];
            ;
            
            Parent *parent = classBase.resultClassArr[i];
            
            [parentArray addObject:parent];
            
            for (ResultDishesClass *resultClass in parent.resultParentArr) {
                
                DishesClass *dishesClass = [[DishesClass alloc]init];
                
                dishesClass.ID = resultClass.ID;
                dishesClass.name = resultClass.name;
                dishesClass.parentId = resultClass.parentId;
                
                [classArray addObject:dishesClass];
            }
            
            [mArray addObject:classArray];
            
        }
        
        //将数组传回去
        
        
        if (block) {
            block(mArray,parentArray);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求错误：%@",error);
        return ;
    }];
}

//根据类别的id请求分类的数据
- (void)GetJSONDataWithClass:(int)ID :(int)pn{
    
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    ;
    
    NSString *urlstring = [NSString stringWithFormat:@"http://apis.juhe.cn/cook/index?key=ea87a5eab29c700950682befcd7c99fc&cid=%d&rn=10&pn=%d",ID,pn];
    
    urlstring = [urlstring stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
     
       
        Data *base = [[Data alloc]initWithDictionary:responseObject];
        for (int i = 0; i<base.resultDishesArr.count; i++) {
            
            ResultDishes *resultDishes = base.resultDishesArr[i];
            
            Dishes *dishes = [[Dishes alloc]init];
            
            dishes.title = resultDishes.title;
            dishes.albums = resultDishes.albums;
            dishes.ingredients = resultDishes.ingredients;
            dishes.imtro = resultDishes.imtro;
            dishes.burden = resultDishes.burden;
            dishes.stepsArr = resultDishes.stepsArr;
            dishes.ID = resultDishes.ID;
            dishes.isCollect = resultDishes.isCollect;
            
            [mArray addObject:dishes];
            
        }
        
        //将数组传回去
        
        [self.delegate getJsonDataWith:nil :mArray];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求错误：%@",error);
        return ;
    }];
    
    
}

//搜索
- (void)GetJSONDataWithName:(NSString *)name :(int)pn{
    
    NSLog(@"调用请求方法");
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    ;
    
    NSString *urlstring = [NSString stringWithFormat:@"http://apis.juhe.cn/cook/query?key=ea87a5eab29c700950682befcd7c99fc&menu=%@&rn=10&pn=%d",name,pn];
    
    urlstring = [urlstring stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    
//    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"-----%@",responseObject);
        
        Data *base = [[Data alloc]initWithDictionary:responseObject];
        for (int i = 0; i<base.resultDishesArr.count; i++) {
            
            ResultDishes *resultDishes = base.resultDishesArr[i];
            
            Dishes *dishes = [[Dishes alloc]init];
            
            dishes.title = resultDishes.title;
            dishes.albums = resultDishes.albums;
            dishes.ingredients = resultDishes.ingredients;
            dishes.imtro = resultDishes.imtro;
            dishes.burden = resultDishes.burden;
            dishes.stepsArr = resultDishes.stepsArr;
            dishes.ID = resultDishes.ID;
            dishes.isCollect = resultDishes.isCollect;
            
            [mArray addObject:dishes];
        }
        //将数组传回去
        [self.delegate getJsonDataWith:nil :mArray];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求错误：%@",error);
        return ;
    }];
    

}


@end
