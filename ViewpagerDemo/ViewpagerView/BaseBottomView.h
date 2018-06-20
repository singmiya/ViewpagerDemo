//
//  BaseBottomView.h
//  ViewpagerDemo
//
//  Created by Somiya on 20/06/2018.
//  Copyright © 2018 Somiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseBottomView : UIView
- (instancetype)initWithFrame:(CGRect)frame sumPages:(NSInteger)sumPages;
- (void)indexChanged:(NSInteger)index;
@end
