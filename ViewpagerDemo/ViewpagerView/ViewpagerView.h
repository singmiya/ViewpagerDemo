//
// Created by Somiya on 10/06/2018.
// Copyright (c) 2018 Somiya. All rights reserved.
//
// 图片轮播无限滑动原理：把一个scrollview的contentSize的宽度设置的很大，让用户很难滑动到边界处。模拟出的无限滑动轮播

#import <UIKit/UIKit.h>
#import "BaseBottomView.h"
@class ViewpagerView;
@class ViewpagerViewCell;
typedef NS_ENUM(NSInteger, ViewpagerViewStyle) {
    ViewpagerViewStyleDefault
};

@protocol ViewpagerViewDelegate <NSObject, UIScrollViewDelegate>
@optional
- (void)viewpagerView:(ViewpagerView *)viewpagerView didSelectPage:(NSInteger)index;
@end

@interface ViewpagerView : UIScrollView
@property (nonatomic, weak, nullable) id<ViewpagerViewDelegate> delegate;


- (instancetype)initViewpagerViewWith:(CGRect)frame dataSource:(NSArray *)dataSource viewStyle:(ViewpagerViewStyle)viewStyle andBottomStyle:(BottomViewStyle)bottomStyle;

- (void)setPageControlDisplayColor:(UIColor *)pcDisplayColor;
- (void)setPageControlNormalColor:(UIColor *)pcNormalColor;
@end
