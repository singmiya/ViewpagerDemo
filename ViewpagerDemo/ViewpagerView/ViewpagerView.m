//
// Created by Somiya on 10/06/2018.
// Copyright (c) 2018 Somiya. All rights reserved.
//

#import "ViewpagerView.h"
#import "Constants.h"
#import "ViewpagerViewCell.h"

#define MAX_PAGE_NUMS 10000
#define INTERVAL 1

@interface ViewpagerView() {
    ViewpagerViewStyle _view_style; // 主视图样式
    BottomViewStyle _bottom_style; // 底部视图样式
    NSArray *_data_source; // 数据源
    NSInteger _current_page; // 当前页码
    Class _current_view_class;
    Class _current_bottom_class;
}
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) BaseBottomView *bottomView;
@property (nonatomic, strong) NSMutableDictionary *visibleCells;
@property (nonatomic, strong) NSMutableSet *reusePool;

@end

@implementation ViewpagerView
@synthesize delegate = _delegate;
#pragma mark - system methods
- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutViewpagerView];
}

#pragma mark - couter API
- (instancetype)initViewpagerViewWith:(CGRect)frame dataSource:(NSArray *)dataSource  viewStyle:(ViewpagerViewStyle)viewStyle andBottomStyle:(BottomViewStyle)bottomStyle {
    self = [super initWithFrame:frame];
    if (self) {
        _view_style = viewStyle;
        _bottom_style = bottomStyle;
        _data_source = dataSource;
        switch (_view_style) {
            case ViewpagerViewStyleDefault:
                _current_view_class = [ViewpagerViewCell class];
                break;
            default:
                _current_view_class = [ViewpagerViewCell class];
                break;
        }
        switch (_bottom_style) {
            case BottomViewStyleDefault:
                _current_bottom_class = [BaseBottomView class];
                break;
            default:
                _current_bottom_class = [BaseBottomView class];
                break;
        }
        [self initViewUI];
        [self startTimer];
    }
    return self;
}

- (void)setPageControlNormalColor:(UIColor *)pcNormalColor {
    [self.bottomView setPcNormalColor:pcNormalColor];
}

- (void)setPageControlDisplayColor:(UIColor *)pcDisplayColor {
    [self.bottomView setPcDisplayColor:pcDisplayColor];
}

#pragma mark - property
- (NSMutableSet *)reusePool {
    if (_reusePool == nil) {
        _reusePool = [NSMutableSet set];
    }
    return _reusePool;
}

- (NSMutableDictionary *)visibleCells {
    if (_visibleCells == nil) {
        _visibleCells = [NSMutableDictionary dictionary];
    }
    return _visibleCells;
}

#pragma mark - private
- (void)initViewUI {
    self.contentSize = CGSizeMake(MAX_PAGE_NUMS * self.bounds.size.width, self.bounds.size.height);
    _current_page = MAX_PAGE_NUMS / 2;
    self.contentOffset = CGPointMake(_current_page * self.bounds.size.width, 0);
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    // 初始化底部视图
    self.bottomView = [[_current_bottom_class alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 30, self.bounds.size.width, 30) dataSource:_data_source bottomStyle:_bottom_style];
    [self addSubview:self.bottomView];
}

/**
 * 根据标识符获取重用cell
 */
- (ViewpagerViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    ViewpagerViewCell *reuseCell = nil;
    for (ViewpagerViewCell *cell in self.reusePool) {
        if ([cell.reuseIdentifier isEqualToString:identifier]) {
            reuseCell = cell;
            break;
        }
    }
    if (reuseCell) {
        [self.reusePool removeObject:reuseCell];
    }
    return reuseCell;
}

/**
 * 开启定时器
 */
- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:INTERVAL repeats:YES block:^(NSTimer * _Nonnull timer) {
        self->_current_page ++;
        [UIView animateWithDuration:.5 animations:^{
            self.contentOffset = CGPointMake(self->_current_page * self.bounds.size.width, 0);
            self.bottomView.frame = (CGRect){{self.contentOffset.x, self.bottomView.frame.origin.y}, self.bottomView.frame.size};
        }];
    }];
}

/**
 * 停止并销毁定时器
 */
- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self stopTimer];
}

/**
 * 结束点击事件
 */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(viewpagerView:didSelectPage:)]) {
        NSInteger index = _current_page % _data_source.count;
        [self.delegate viewpagerView:self didSelectPage:index];
    }
    [self startTimer];
}

// 布局cell
- (void)layoutViewpagerView {
    // 计算要显示的是哪些行
    CGFloat width = self.bounds.size.width;
    CGFloat startX = self.contentOffset.x;
    _current_page = ceil(startX / width);
    NSInteger index = _current_page % _data_source.count;
    
    // 更新bottom view的位置
    self.bottomView.frame = (CGRect){{startX, self.bottomView.frame.origin.y}, self.bottomView.frame.size};
    [self.bottomView indexChanged:index];
    
    NSRange range = NSMakeRange(_current_page - 1, 3);
    // 放置需要显示的cell
    for (NSUInteger i = range.location; i < range.location + range.length; i++) {
        ViewpagerViewCell *cell = [self.visibleCells objectForKey:@(i)];
        if (cell == nil) {
            cell = [self dequeueReusableCellWithIdentifier:@"viewpagercell"];
            if (cell == nil) {
                cell = [[_current_view_class alloc] initWithFrame:self.bounds reuseIdentifier:@"viewpagercell"];
            }
            [cell configCellData:_data_source[index]];
            [self.visibleCells setObject:cell forKey:@(i)];
            cell.frame = CGRectMake(i * width, 0, self.frame.size.width, self.bounds.size.height);
            [self insertSubview:cell belowSubview:self.bottomView];
        }
    }
    
    // 移除离开屏幕的cell,同时放入重用池
    NSArray *allVisibleCells = [self.visibleCells allKeys];
    for (NSNumber *numb in allVisibleCells) {
        if (!NSLocationInRange([numb integerValue], range)) {
            ViewpagerViewCell *cell = [self.visibleCells objectForKey:numb];
            [self.reusePool addObject:cell];
            [self.visibleCells removeObjectForKey:numb];
            [cell removeFromSuperview];
        }
    }
}

@end
