//
//  LFSAlbumCell.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <PINRemoteImage/PINImageView+PINRemoteImage.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>

#import "LFSAlbumCell.h"

@interface LFSAlbumCell ()

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;

@property (nonatomic, strong) UIView *overlayView;

@end

@implementation LFSAlbumCell

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
    [self.coverView pin_cancelImageDownload];
    
    self.coverView.image = nil;
    self.titleLabel.text = nil;
    self.titleLabel.text = nil;
}

#pragma mark - Setup

- (void)setupDefaults {
    [self setupImageView];
    [self setupOverlayView];
    [self setupTitleLabel];
    [self setupSubtitleLabel];
    
    [self setupContentView];
    [self setupLayout];
}

- (void)setupContentView {
    self.contentView.layer.borderColor = [UIColor grayColor].CGColor;
    self.contentView.layer.borderWidth = 1.0f;
}

- (void)setupImageView {
    self.coverView = [[UIImageView alloc] init];
    self.coverView.contentMode = UIViewContentModeScaleAspectFill;
    self.coverView.clipsToBounds = YES;
    [self.contentView addSubview:self.coverView];
}

- (void)setupOverlayView {
    self.overlayView = [UIView new];
    self.overlayView.backgroundColor = [UIColor blackColor];
    self.overlayView.alpha = 0.6f;
    
    [self.contentView addSubview:self.overlayView];
}

- (void)setupTitleLabel {
    self.titleLabel = [UILabel new];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    self.titleLabel.textColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.titleLabel];
}

- (void)setupSubtitleLabel {
    self.subtitleLabel = [UILabel new];
    self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    self.subtitleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
    self.subtitleLabel.textColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.subtitleLabel];
}

- (void)setupLayout {
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.overlayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(self.contentView).multipliedBy(0.3f);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.bottom.equalTo(self.overlayView.mas_centerY).offset(-5);
    }];
    
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.overlayView.mas_centerY).offset(5);
    }];
}

#pragma mark - Bindings

- (void)updateWithModel:(LFSAlbum *)model {
    [super updateWithModel:model];
    
    self.titleLabel.text = model.name;
    self.subtitleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Played %ld times", nil), model.playcount];
    [self.coverView pin_setImageFromURL:model.defaultImageURL placeholderImage:[UIImage imageNamed:@"no-album"]];
}

@end
