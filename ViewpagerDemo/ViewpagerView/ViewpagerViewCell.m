//
// Created by Somiya on 14/06/2018.
// Copyright (c) 2018 Somiya. All rights reserved.
//

#import "ViewpagerViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Constants.h"

#define K_IMAGE   @"image"
#define K_TITLE   @"title"

@interface ViewpagerViewCell()

@end

@implementation ViewpagerViewCell
- (instancetype)initWithFrame:(CGRect)frame reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithFrame:frame];
    if (self) {
        _reuseIdentifier = reuseIdentifier;
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 25, frame.size.width, 25)];
        _titleLabel.backgroundColor = RGBA(100, 100, 100, 0.6);
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.layer.shadowOffset = CGSizeMake(5, -5);
        _titleLabel.layer.shadowRadius = 3;
        _titleLabel.layer.shadowColor = _titleLabel.backgroundColor.CGColor;
        [self addSubview:_titleLabel];
    }
    return self;
}
- (void)configCellData:(NSDictionary *)data {
    _titleLabel.text = data[K_TITLE];
    [_imageView sd_setImageWithURL:data[K_IMAGE]];
}
@end
