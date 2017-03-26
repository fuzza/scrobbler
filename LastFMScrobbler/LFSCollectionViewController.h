//
//  ViewController.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFSDataSource.h"
#import "LFSCollectionViewModel.h"

@interface LFSCollectionViewController <ViewModel : LFSCollectionViewModel *>
    : UIViewController <UICollectionViewDelegate>

@property (nonatomic, readonly) UICollectionView *collectionView;
@property (nonatomic, readonly) ViewModel viewModel;
@property (nonatomic, readonly) LFSDataSource *dataSource;

- (instancetype)initWithViewModel:(ViewModel)viewModel
                       dataSource:(LFSDataSource *)dataSource
                           layout:(UICollectionViewLayout *)layout;

- (void)setupDataSource NS_REQUIRES_SUPER;

@end

