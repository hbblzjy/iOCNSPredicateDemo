//
//  People.h
//  OCTest
//
//  Created by jerry on 17/4/22.
//  Copyright © 2017年 jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSMutableArray *employees;

-(NSComparisonResult)comparePeople:(People *)peo;

@end
