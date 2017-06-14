//
//  ViewController.m
//  OCTest
//
//  Created by jerry on 17/4/22.
//  Copyright © 2017年 jerry. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "Employee.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *people_arr = [NSMutableArray new];
    NSMutableArray *filter_arr = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        People *people = [People new];
        people.name = @[@"jack",@"jester",@"jester",@"joce",@"joke",@"java",@"amy",@"jason",@"mike",@"jwt"][i];
        people.age = 15+i;
        people.gender = i%2? @"男":@"女";
        people.address = @[@"郑州",@"上海",@"济南",@"北京",@"杭州"][arc4random()%5];
        for (int j = 0; j < 3; j ++) {
            Employee *employee = [Employee new];
            employee.employeeId = i+arc4random()%3;
            employee.department = @[@"研发部",@"人事部",@"财务部",@"运营部"][arc4random()%4];
            [people.employees addObject:employee];
        }
        [people_arr addObject:people];
        arc4random()%3 == 0 ? [filter_arr addObject:people] : NULL;
    }
    /*
    // 利用 NSSortDescriptor 对对象数组，按照某一属性或某些属性的升序降序排列
    NSSortDescriptor *des1 = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSSortDescriptor *des2 = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    [people_arr sortUsingDescriptors:@[des1, des2]];
    
    // 利用 block回调 对对象数组，按照某一属性或某些属性的升序降序排列
    [people_arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        People *p1 = (People *)obj1;
        People *p2 = (People *)obj2;
        return [p1.name compare:p2.name];
    }];
    
    // 利用 自定义比较方法 对对象数组，按照某一属性或某些属性的升序降序排列
    [people_arr sortUsingSelector:@selector(comparePeople:)];
    NSLog(@"sorted:%@", people_arr);
    */
    
    
    //------------------------ Predicate谓词的简单使用
    // self 表示数组元素/字符串本身
    // 比较运算符 =/==(等于)、>=/=>(大于等于)、<=/=<(小于等于)、>(大于)、<(小于)、!=/<>(不等于)
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"self = %@",[people_arr lastObject]];//比较数组元素相等
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"address = %@",[(People *)[people_arr lastObject] address]];//比较数组元素中某属性相等
    ////NSPredicate *pre = [NSPredicate predicateWithFormat:@"age in {18,21}"];//比较数组元素中某属性值在这些值中
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"age between {18,21}"];//比较数组元素中某属性值大于等于左边的值，小于等于右边的值
    
    // 逻辑运算符 and/&&(与)、or/||(或)、not/!(非)
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"address = %@ && age between {19,22}",[(People *)[people_arr lastObject] address]];
    
    // 字符串比较运算符 beginswith(以*开头)、endswith(以*结尾)、contains(包含)、like(匹配)、matches(正则)
    // [c]不区分大小写 [d]不区分发音符号即没有重音符号 [cd]既 又
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"name beginswith[cd] 'ja'"];
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"name matches '^[a-zA-Z]{4}$'"];
    
    //集合运算符 some/any:集合中任意一个元素满足条件、all:集合中所有元素都满足条件、none:集合中没有元素满足条件、in:集合中元素在另一个集合中
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"all employees.employeeId in {7,8,9}"];
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"self in %@",filter_arr];
    // $K：用于动态传入属性名、%@：用于动态设置属性值(字符串、数字、日期对象)、$(value)：可以动态改变
    //NSPredicate *pre = [NSPredicate predicateWithFormat:@"%K > $age",@"age"];
    //pre = [pre predicateWithSubstitutionVariables:@{@"age":@21}];
    // NSCompoundPredicate 相当于多个NSPredicate的组合
    //NSCompoundPredicate *compPre = [NSCompoundPredicate andPredicateWithSubpredicates:@[[NSPredicate predicateWithFormat:@"age > 19"],[NSPredicate predicateWithFormat:@"age < 21"]]];
    // 暂时没找到用法
    //NSComparisonPredicate *compPre = [NSComparisonPredicate predicateWithLeftExpression:[NSExpression expressionForKeyPath:@"name"] rightExpression:[NSExpression expressionForVariable:@"ja"] modifier:NSAnyPredicateModifier type:NSBeginsWithPredicateOperatorType options:NSNormalizedPredicateOption];
    //[people_arr filterUsingPredicate:compPre];
    NSPredicate *pre = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject age] > 21;
    }];
    
    // NSPredicate 不影响原数组，返回数组即为过滤结果
    //NSArray *temp_arr = [people_arr filteredArrayUsingPredicate:pre];
    //NSLog(@"%@", temp_arr);
    // NSPredicate 原数组数据即为过滤结果
    [people_arr filterUsingPredicate:pre];
    
    NSLog(@"%@", people_arr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
