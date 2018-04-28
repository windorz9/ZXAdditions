//
//  ViewController.m
//  ZXAdditions
//
//  Created by windorz on 2018/4/28.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import "ViewController.h"
#import "ZXAdditions.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@6,@6,@6,@6,@6,@6,@6,@6];
    NSLog(@"%@", array);
    
    NSDictionary *dic = @{@"key" : @"windorz",
                          @"key1" : @"zx",
                          @"key2" : @"w"
                          };
    NSLog(@"%@", dic);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
