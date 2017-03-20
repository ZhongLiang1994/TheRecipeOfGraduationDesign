//
//  NetworkingDataSource.h
//  TheRecipeOfGraduationDesign
//
//  Created by 钟亮 on 2017/1/3.
//  Copyright © 2017年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>


//数据回传协议
@protocol getJsonDelegate <NSObject>

- (void)getJsonDataWith:(Dishes *)dishes :(NSArray *)array;

@end
@interface NetworkingDataSource : NSObject



+ (instancetype)sharedInstance;

@property (nonatomic ,weak)id<getJsonDelegate> delegate;

- (void)GetJSONData:(NSString *)ID;

- (void)GetJSONClassData:(void(^)(NSArray *array,NSArray *parentArr))block;

- (void)GetJSONDataWithClass:(int)ID :(int)pn;

- (void)GetJSONDataWithName:(NSString *)name :(int)pn;

@end
