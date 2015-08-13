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
/** 选择的序号 **/
@property(nonatomic, assign) NSInteger selectedIndex;

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
        int width = 10;
        _selectedIndex = 0;
        
        for (int i = 0; i < captions.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor clearColor];
            btn.titleLabel.font = [UIFont systemFontOfSize:kButtonNormalSize];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:231/255.f green:0/255.f blue:8/255.f alpha:1.f] forState:UIControlStateSelected];
            
            NSString *caption = [captions objectAtIndex:i];
            [btn setTitle:caption forState:UIControlStateNormal];
            btn.tag = kButtonTagStart + i;
            
            CGSize size = [caption sizeWithFont:[UIFont systemFontOfSize:kButtonNormalSize] constrainedToSize:CGSizeMake(MAXFLOAT, 50) lineBreakMode:NSLineBreakByWordWrapping];
            btn.frame = CGRectMake(width, 10, size.width+3, 25);
            [self addSubview:btn];
            
            width += size.width + 20;
        }
        
        self.contentSize = CGSizeMake(width, 30);
        self.showsHorizontalScrollIndicator = NO;
        
        CGRect rc = [self viewWithTag:_selectedIndex + kButtonTagStart].frame;
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(rc.origin.x - 2, self.frame.size.height - 6, rc.size.width+4, 2)];
        _lineView.backgroundColor = RGBCOLOR(231, 0, 18);
        [self addSubview:_lineView];
    }
    return self;
}

@end
