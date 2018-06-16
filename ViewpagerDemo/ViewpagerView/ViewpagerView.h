//
// Created by Somiya on 10/06/2018.
// Copyright (c) 2018 Somiya. All rights reserved.
//

#import <UIKit/UIKit.h>
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
@property (nonatomic, strong) UIView *bottomView;


- (instancetype)initViewpagerViewWith:(CGRect)frame style:(ViewpagerViewStyle)style andDataSource:(NSArray *)dataSource;
@end
