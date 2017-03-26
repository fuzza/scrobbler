//
//  LFSArtistCollectionCell.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <PINRemoteImage/PINImageView+PINRemoteImage.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>
#import "LFSArtistCell.h"

@interface LFSArtistCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *listenersLabel;

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation LFSArtistCell

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setupDefaults];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.imageView pin_cancelImageDownload];
    
    self.imageView.image = nil;
    self.titleLabel.text = nil;
    self.listenersLabel.text = nil;
}

#pragma mark - Setup

- (void)setupDefaults {
    [self setupImageView];
    [self setupTitleLabel];
    [self setupSubtitleLabel];
    [self setupSeparator];
    
    [self setupLayout];
}

- (void)setupImageView {
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.imageView];
}

- (void)setupTitleLabel {
    self.titleLabel = [UILabel new];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    self.titleLabel.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:self.titleLabel];
}

- (void)setupSubtitleLabel {
    self.listenersLabel = [UILabel new];
    self.listenersLabel.textAlignment = NSTextAlignmentLeft;
    self.listenersLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
    self.listenersLabel.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:self.listenersLabel];
}

- (void)setupSeparator {
    self.separatorView = [UIView new];
    self.separatorView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.separatorView];
}

- (void)setupLayout {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView.mas_height);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-5);
    }];
    
    [self.listenersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.contentView.mas_centerY).offset(5);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.offset(1.0f);
    }];
}

#pragma mark - Bindings

- (void)updateWithModel:(LFSArtist *)model {
    [super updateWithModel:model];
    
    self.titleLabel.text = model.name;
    self.listenersLabel.text = [NSString stringWithFormat:NSLocalizedString(@"(%d listeners)", nil), model.listeners];
    
    [self.imageView pin_setImageFromURL:model.defaultImageURL placeholderImage:[UIImage imageNamed:@"no-artist"]];
}

@end
