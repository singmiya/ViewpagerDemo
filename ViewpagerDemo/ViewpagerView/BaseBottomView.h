//
//  BaseBottomView.h
//  ViewpagerDemo
//
//  Created by Somiya on 20/06/2018.
//  Copyright © 2018 Somiya. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BottomViewStyle) {
    // 底部视图样式 0b1111100000 == 0x03e0
    BottomViewStyleDefault                      = 0 << 5,
    
    // page control样式 ob111110000000000 == 0x7c00
    BottomViewStylePageControlSquare            = 0 << 10, // default
    BottomViewStylePageControlRectangle         = 1 << 10,
    BottomViewStylePageControlCircle            = 2 << 10,
    
    // 0b11111000000000000000 == 0x0f8000
    BottomViewStylePageControlCenter            = 0 << 15, //default
    BottomViewStylePageControlLeft              = 1 << 15,
    BottomViewStylePageControlRight             = 2 << 15,
    
    // 0b 0001 1111 0000 0000 0000 0000 0000 == 0x01f00000
    BottomViewStylePageControlFeatureScale      = 1 << 20
};

@interface BaseBottomView : UIView
@property (nonatomic, strong) UIColor *pcDisplayColor; // page control 展示时的颜色
@property (nonatomic, strong) UIColor *pcNormalColor; // page control 非展示时颜色


- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource bottomStyle:(BottomViewStyle)bottomStyle;
- (void)indexChanged:(NSInteger)index;
@end
