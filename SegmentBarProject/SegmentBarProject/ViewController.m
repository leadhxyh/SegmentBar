//
//  ViewController.m
//  SegmentBarProject
//
//  Created by liaowei on 15/8/13.
//  Copyright (c) 2015年 liaowei. All rights reserved.
//

#import "ViewController.h"
#import "SegmentBarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *captions = @[@"头条", @"热点",@"体育",@"娱乐",@"本地",@"财经",@"科技",@"直播",@"跟贴",@"历史",@"房产",@"军事",@"国际足球"];
    SegmentBarView *barView = [[SegmentBarView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44) andItems:captions];
    [self.view addSubview:barView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
