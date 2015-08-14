//
//  NewsViewController.m
//  SegmentBarProject
//
//  Created by liaowei on 15/8/14.
//  Copyright (c) 2015年 liaowei. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 100, 60);
    label.text = self.tag;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
