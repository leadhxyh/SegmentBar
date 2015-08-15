//
//  ViewController.m
//  SegmentBarProject
//
//  Created by liaowei on 15/8/13.
//  Copyright (c) 2015年 liaowei. All rights reserved.
//

#import "ViewController.h"
#import "SegmentBarView.h"
#import "ContentView.h"
#import "NewsViewController.h"

@interface ViewController ()<SegmentDelegate>
@property (nonatomic, assign) int currentIndex;
@property (nonatomic, strong) SegmentBarView *barView;
@property (nonatomic, strong) ContentView *cv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *captions = @[@"头条", @"热点",@"体育",@"娱乐",@"本地",@"财经",@"科技",@"直播",@"跟贴",@"历史",@"房产",@"军事",@"国际足球"];
    _barView = [[SegmentBarView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44) andItems:captions];
    _barView.clickDelegate = self;
    [self.view addSubview:_barView];
    
    NewsViewController *vc1 = [[NewsViewController alloc] init];
    vc1.tag = @"头条";
    [self addChildViewController:vc1];
    NewsViewController *vc2 = [[NewsViewController alloc] init];
    vc2.tag = @"热点";
    [self addChildViewController:vc2];
    NewsViewController *vc3 = [[NewsViewController alloc] init];
    vc3.tag = @"体育";
    [self addChildViewController:vc3];
    NewsViewController *vc4 = [[NewsViewController alloc] init];
    vc4.tag = @"娱乐";
    [self addChildViewController:vc4];
    NewsViewController *vc5 = [[NewsViewController alloc] init];
    vc5.tag = @"本地";
    [self addChildViewController:vc5];
    NewsViewController *vc6 = [[NewsViewController alloc] init];
    vc6.tag = @"财经";
    [self addChildViewController:vc6];
    NewsViewController *vc7 = [[NewsViewController alloc] init];
    vc7.tag = @"科技";
    [self addChildViewController:vc7];
    NewsViewController *vc8 = [[NewsViewController alloc] init];
    vc8.tag = @"直播";
    [self addChildViewController:vc8];
    NewsViewController *vc9 = [[NewsViewController alloc] init];
    vc9.tag = @"跟贴";
    [self addChildViewController:vc9];
    NewsViewController *vc10 = [[NewsViewController alloc] init];
    vc10.tag = @"历史";
    [self addChildViewController:vc10];
    NewsViewController *vc11 = [[NewsViewController alloc] init];
    vc11.tag = @"房产";
    [self addChildViewController:vc11];
    NewsViewController *vc12 = [[NewsViewController alloc] init];
    vc12.tag = @"军事";
    [self addChildViewController:vc12];
    NewsViewController *vc13 = [[NewsViewController alloc] init];
    vc13.tag = @"国际足球";
    [self addChildViewController:vc13];
    NSArray *controllers = @[vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9, vc10, vc11, vc12, vc13];
    _cv = [[ContentView alloc] initWithFrame:CGRectMake(0, 44 + _barView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height) andControllers:controllers];
    _cv.swipeDelegate = self;
    [self.view addSubview:_cv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)contentSelectedSegmentIndexChanged:(int)segmentIndex {
    NSLog(@"contentSelectedSegmentIndexChanged");
    _currentIndex = segmentIndex;
    [_barView setCurrentSegmentBaeIndex:segmentIndex];
    
}

- (void)barSegmentIndexChanged:(int)segmentIndex {
    _currentIndex = segmentIndex;
    [_cv setCurrentTableViewIndex:segmentIndex];
}

@end
