//
// Created by Somiya on 14/06/2018.
// Copyright (c) 2018 Somiya. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewpagerViewCell : UIView
@property (nonatomic, readonly, strong) UIImageView *imageView;
@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) NSString *reuseIdentifier;

- (instancetype)initWithFrame:(CGRect)frame reuseIdentifier:(nullable NSString *)reuseIdentifier;
- (void)configCellData:(NSDictionary *)data;
@end
