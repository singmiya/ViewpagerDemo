//
//  BaseBottomView.m
//  ViewpagerDemo
//
//  Created by Somiya on 20/06/2018.
//  Copyright © 2018 Somiya. All rights reserved.
//

#import "BaseBottomView.h"

#define ITEM_W 15
#define ITEM_H 7
#define PAGE_CONTROL_MARGIN 25


@interface BaseBottomView() {
    NSArray *_data_source;
    NSInteger _index;
    BottomViewStyle _style;
}
@property (nonatomic, strong) NSArray *displayItems;
@property (nonatomic, strong) UIView *pageControlView;
@end

@implementation BaseBottomView
- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource  bottomStyle:(BottomViewStyle)bottomStyle {
    self = [self initWithFrame:frame];
    if (self) {
        _style = bottomStyle;
        _data_source = dataSource;
        _index = 0;
        [self initUI];
    }
    return self;
}

- (void)initUI {
    CGSize item_size = CGSizeZero;
    switch (_style & 0x7c00) {
        case BottomViewStylePageControlCircle:
            item_size = CGSizeMake(ITEM_H, ITEM_H);
            break;
        case BottomViewStylePageControlRectangle:
            item_size = CGSizeMake(ITEM_W, ITEM_H * 0.5);
            break;
        default:
            item_size = CGSizeMake(ITEM_H, ITEM_H);
            break;
    }
    
    CGFloat pc_w = PAGE_CONTROL_MARGIN * 2 + _data_source.count * item_size.width + (_data_source.count - 1) * ITEM_H;
    CGFloat pc_x = 0.0f;
    switch (_style & 0x0f8000) {
        case BottomViewStylePageControlCenter:
            pc_x = (self.bounds.size.width - pc_w) / 2;
            break;
        case BottomViewStylePageControlLeft:
            pc_x = 0.0f;
            break;
        case BottomViewStylePageControlRight:
            pc_x = self.bounds.size.width - pc_w;
            break;
        default:
            pc_x = (self.bounds.size.width - pc_w) / 2;
            break;
    }
    self.pageControlView = [[UIView alloc] initWithFrame:CGRectMake(pc_x, 0, pc_w, self.bounds.size.height)];

    [self addSubview:self.pageControlView];
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < _data_source.count; i++) {
        CGFloat item_x = PAGE_CONTROL_MARGIN + i * item_size.width + i * ITEM_H;
        UIView *item = [[UIView alloc] initWithFrame:(CGRect) {{item_x, (self.bounds.size.height - ITEM_H) / 2}, item_size}];
        if (i == 0) {
            _pcDisplayColor =  [UIColor whiteColor];;
            item.backgroundColor = _pcDisplayColor;
        } else {
            _pcNormalColor = [UIColor lightGrayColor];
            item.backgroundColor = _pcNormalColor;
        }
        if (item_size.width == item_size.height) {
            item.layer.cornerRadius = ITEM_H / 2.0;
            item.layer.masksToBounds = YES;
        }
        [self.pageControlView addSubview:item];
        [temp addObject:item];
    }
    self.displayItems = [NSArray arrayWithArray:temp];
}

- (void)indexChanged:(NSInteger)index {
    NSInteger lastIndex = _index;
    if (lastIndex == index) {
        return;
    }
    _index = index;
    
    [UIView animateWithDuration:0.2 animations:^{
        UIView *item = self.displayItems[index];
        item.backgroundColor = self->_pcDisplayColor;
        UIView *lastItem = self.displayItems[lastIndex];
        lastItem.backgroundColor = self->_pcNormalColor;
    }];
}

- (void)setPcDisplayColor:(UIColor *)pcDisplayColor {
    _pcDisplayColor = pcDisplayColor;
    UIView *item = self.displayItems[_index];
    item.backgroundColor = pcDisplayColor;
}

- (void)setPcNormalColor:(UIColor *)pcNormalColor {
    _pcNormalColor = pcNormalColor;
    for (int i = 0; i < self.displayItems.count; i++) {
        if (i == _index) {
            continue;
        }
        UIView *item = self.displayItems[i];
        item.backgroundColor = pcNormalColor;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
