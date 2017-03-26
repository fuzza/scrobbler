//
//  LFSDataSource.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "LFSDataSource.h"
#import "LFSBaseCell.h"
#import "LFSAlbumCell.h"
#import "LFSArtistCell.h"

@implementation LFSDataSource

+ (instancetype)albumsDataSource {
    return [self dataSourceWithCellClass:[LFSAlbumCell class]];
}

+ (instancetype)artistsDataSource {
    return [self dataSourceWithCellClass:[LFSArtistCell class]];
}

+ (instancetype)dataSourceWithCellClass:(Class)cellClass {
    LFSDataSource *dataSource = [[LFSDataSource alloc] initWithItems:@[]];
    dataSource.cellClass = cellClass;
    return dataSource;
}


- (instancetype)initWithItems:(NSArray *)items {
    self = [super initWithItems:items];
    if(self) {
        [self setupDefaults];
    }
    return self;
}

- (void)setupDefaults {
    self.cellConfigureBlock = ^(LFSBaseCell *cell,
                                id model,
                                UICollectionView *collectionView,
                                NSIndexPath *indexPath) {
        [cell updateWithModel:model];
    };
}

- (void)setCollectionView:(UICollectionView *)collectionView {
    [super setCollectionView:collectionView];
    [self.collectionView registerClass:self.cellClass
            forCellWithReuseIdentifier:[self.cellClass identifier]];
}

@end
