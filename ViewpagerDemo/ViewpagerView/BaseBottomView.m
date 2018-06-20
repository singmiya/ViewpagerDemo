//
//  BaseBottomView.m
//  ViewpagerDemo
//
//  Created by Somiya on 20/06/2018.
//  Copyright © 2018 Somiya. All rights reserved.
//

#import "BaseBottomView.h"

@interface BaseBottomView() {
    NSInteger _sumPages;
    NSInteger _index;
}
@end

@implementation BaseBottomView
- (instancetype)initWithFrame:(CGRect)frame sumPages:(NSInteger)sumPages {
    self = [self initWithFrame:frame];
    if (self) {
        _sumPages = sumPages;
        _index = 0;
    }
    return self;
}

- (void)indexChanged:(NSInteger)index {
    _index = index;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
