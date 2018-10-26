//
//  SJButtonItemCollectionViewCell.m
//  SJVideoPlayer
//
//  Created by BlueDancer on 2018/10/20.
//  Copyright © 2018 畅三江. All rights reserved.
//

#import "SJButtonItemCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation SJButtonItemCollectionViewCell
static NSString *SJButtonItemCollectionViewCellID = @"SJButtonItemCollectionViewCell";
+ (void)registerWithCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:SJButtonItemCollectionViewCellID];
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:SJButtonItemCollectionViewCellID forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    [self _setupView];
    return self;
}

- (void)_setupView {
    [self.contentView addSubview:self.button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

- (void)clickedButton:(UIButton *)btn {
    if ( _clickedButtonExeBlock ) _clickedButtonExeBlock(self);
}

@synthesize button = _button;
- (SJButton *)button {
    if ( _button ) return _button;
    _button = [SJButton new];
    _button.clipsToBounds = YES;
    [_button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    return _button;
}

@synthesize customViewContainerView = _customViewContainerView;
- (UIView *)customViewContainerView {
    if ( _customViewContainerView ) return _customViewContainerView;
    _customViewContainerView = [UIView new];
    [self.contentView addSubview:_customViewContainerView];
    [_customViewContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    return _customViewContainerView;
}

- (void)removeSubviewsFromCustomViewContainerView {
    [_customViewContainerView.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}
@end


@implementation SJButton
@synthesize sj_titleLabel = _sj_titleLabel;
@synthesize sj_imageView = _sj_imageView;

- (UILabel *)sj_titleLabel {
    if ( _sj_titleLabel ) return _sj_titleLabel;
    _sj_titleLabel = [[UILabel alloc] init];
    _sj_titleLabel.numberOfLines = 0;
    [self addSubview:_sj_titleLabel];
    [_sj_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    return _sj_titleLabel;
}

- (UIImageView *)sj_imageView {
    if ( _sj_imageView ) return _sj_imageView;
    _sj_imageView = [[UIImageView alloc] init];
    _sj_imageView.contentMode = UIViewContentModeCenter;
    
    [self addSubview:_sj_imageView];
    [_sj_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    return _sj_imageView;
}
@end