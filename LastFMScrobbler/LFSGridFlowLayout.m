//
//  LFSGridFlowLayout.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSGridFlowLayout.h"

@implementation LFSGridFlowLayout

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
    self.minimumInteritemSpacing = 4;
    self.minimumLineSpacing = 4;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
}

- (CGFloat)sideLength {
    return (CGRectGetWidth(self.collectionView.frame) - 4) / 2;
}

#pragma mark - UICollectionViewFlowLayout

- (CGSize)itemSize {
    return CGSizeMake([self sideLength], [self sideLength]);
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
