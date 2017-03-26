//
//  LFSListFlowLayout.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/24/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSListFlowLayout.h"

static CGFloat const kLFSListFlowLayoutDefaultHeight = 80.0f;

@implementation LFSListFlowLayout

- (instancetype)init {
    self = [super init];
    if(self) {
        [self setupLayout];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
}

- (CGFloat)itemWidth {
    return CGRectGetWidth(self.collectionView.frame);
}

#pragma mark - UICollectionViewFlowLayout

- (CGSize)itemSize {
    return CGSizeMake([self itemWidth], self.itemHeight ? self.itemHeight : kLFSListFlowLayoutDefaultHeight);
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    return self.collectionView.contentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds)) {
        return YES;
    }
    return NO;
}

@end
