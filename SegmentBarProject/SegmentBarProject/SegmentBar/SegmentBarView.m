//
//  SegmentBarView.m
//  SegmentBarProject
//
//  Created by liaowei on 15/8/13.
//  Copyright (c) 2015年 liaowei. All rights reserved.
//

#import "SegmentBarView.h"

#define kButtonNormalSize 16
#define kButtonSelectSize 20
#define kButtonTagStart 300

@interface SegmentBarView()
/** 每个分段对象 **/
@property(nonatomic, strong) NSMutableArray *segmentArray;
/** 底部横线 **/
@property(nonatomic, strong) UIView *lineView;
/** 当前选择的序号 **/
@property(nonatomic, assign) NSInteger currentIndex;
/** 上一次选择的序号 **/
@property(nonatomic, assign) NSInteger lastIndex;

@end

@implementation SegmentBarView

- (NSMutableArray *)segmentArray {
    if (_segmentArray == nil) {
        _segmentArray = [[NSMutableArray alloc] init];
    }
    return _segmentArray;
}

- (id)initWithFrame:(CGRect)frame andItems:(NSArray *)captions {
    self = [super initWithFrame:frame];
    if (self) {
        int width = 15;
        _currentIndex = 0;
        
        for (int i = 0; i < captions.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor clearColor];
            btn.titleLabel.font = [UIFont systemFontOfSize:kButtonNormalSize];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:231/255.f green:0/255.f blue:8/255.f alpha:1.f] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(segmentClickAction:) forControlEvents:UIControlEventTouchUpInside];
            
            NSString *caption = [captions objectAtIndex:i];
            [btn setTitle:caption forState:UIControlStateNormal];
            btn.tag = kButtonTagStart + i;
            
            CGSize size = [caption sizeWithFont:[UIFont systemFontOfSize:kButtonSelectSize] constrainedToSize:CGSizeMake(MAXFLOAT, 50) lineBreakMode:NSLineBreakByWordWrapping];
            btn.frame = CGRectMake(width, 10, size.width+3, 25);
            [self addSubview:btn];
            
            width += size.width + 20;
            [self.segmentArray addObject:btn];
            
            if (i == 0) {
                btn.selected = YES;
                btn.titleLabel.font = [UIFont systemFontOfSize:kButtonSelectSize];
            }
        }
        
        self.contentSize = CGSizeMake(width, 30);
        self.showsHorizontalScrollIndicator = NO;
        
        CGRect rc = [self viewWithTag:_currentIndex + kButtonTagStart].frame;
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(rc.origin.x - 2, self.frame.size.height - 6, rc.size.width+4, 2)];
        _lineView.backgroundColor = RGBCOLOR(231, 0, 18);
        [self addSubview:_lineView];
    }
    return self;
}

- (void)segmentClickAction:(UIButton *)btn {
    UIButton *segBtn = (UIButton *)btn;
    if (_currentIndex != segBtn.tag - kButtonTagStart) {
        [self showSelectSegment:(int)(segBtn.tag - kButtonTagStart)];
    }
}

- (void)showSelectSegment:(int)index {
    if (_currentIndex != index) {
        _lastIndex = _currentIndex;
        _currentIndex = index;
        
        UIButton *currentBtn = [_segmentArray objectAtIndex:_currentIndex];
        UIButton *lastBtn = [_segmentArray objectAtIndex:_lastIndex];
        currentBtn.selected = YES;
        currentBtn.titleLabel.font = [UIFont systemFontOfSize:kButtonSelectSize];
        lastBtn.selected = NO;
        lastBtn.titleLabel.font = [UIFont systemFontOfSize:kButtonNormalSize];
        
        CGRect lineRC = [self viewWithTag:currentBtn.tag].frame;
        _lineView.frame = CGRectMake(lineRC.origin.x-3, self.frame.size.height - 6, lineRC.size.width + 4, 2);
        if (lineRC.origin.x - self.contentOffset.x > self.frame.size.width * 2 / 3 ) {
            NSInteger index = _currentIndex;
            if (index + 2 < [_segmentArray count]) {
                index = _currentIndex + 2;
            } else if (index + 1 < [_segmentArray count]) {
                index = _currentIndex + 1;
            }
            CGRect frame = [self viewWithTag:index + kButtonTagStart].frame;
            [self scrollRectToVisible:frame animated:YES];
        } else if (lineRC.origin.x - self.contentOffset.x < self.frame.size.width / 3) {
            NSInteger index = _currentIndex;
            if (_currentIndex - 2 >= 0) {
                index = _currentIndex - 2;
            } else if (_currentIndex - 1 >= 0) {
                index = _currentIndex - 1;
            }
            CGRect frame = [self viewWithTag:index + kButtonTagStart].frame;
            [self scrollRectToVisible:frame animated:YES];
        }
    }
}

@end
