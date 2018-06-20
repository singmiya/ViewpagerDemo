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
    }
    return self;
}
- (void)configCellData:(NSDictionary *)data {
    [_imageView sd_setImageWithURL:data[K_IMAGE]];
}
@end
