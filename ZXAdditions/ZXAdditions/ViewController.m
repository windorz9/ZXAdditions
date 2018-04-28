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
    
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    textView.attributedText = [NSAttributedString zx_imageTextWithImage:[UIImage imageNamed:@"compost"] imageWH:50 title:@"发布" fontSize:20 titleColor:[UIColor blackColor] spacing:30];
    textView.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:textView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
