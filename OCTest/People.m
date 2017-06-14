//
//  People.m
//  OCTest
//
//  Created by jerry on 17/4/22.
//  Copyright © 2017年 jerry. All rights reserved.
//

#import "People.h"

@implementation People

-(NSComparisonResult)comparePeople:(People *)peo{
    return [self.name compare:peo.name];
}

-(NSMutableArray *)employees{
    if (!_employees) {
        _employees = [NSMutableArray new];
    }
    return _employees;
}

@end
