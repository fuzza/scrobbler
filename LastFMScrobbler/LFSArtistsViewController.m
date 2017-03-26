//
//  LFSArtistsViewController.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/24/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSArtistsViewController.h"
#import "LFSArtistCell.h"
#import "LFSCountry.h"

@interface LFSArtistsViewController ()
@end

@implementation LFSArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFilters];
}

- (void)setupDataSource {
    [super setupDataSource];
    [self.collectionView registerClass:[LFSArtistCell class]
            forCellWithReuseIdentifier:[LFSArtistCell identifier]];
    self.dataSource.cellClass = [LFSArtistCell class];
}

- (void)setupFilters {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 32, 32);
    [button addTarget:self.viewModel action:@selector(didSelectFilter) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    @weakify(self);
    [[RACObserve(self.viewModel, selectedCountry) distinctUntilChanged] subscribeNext:^(LFSCountry *country) {
        @strongify(self);
        UIImage *image = [UIImage imageNamed:self.viewModel.selectedCountry.imageName];
        [button setImage:image forState:UIControlStateNormal];
    }];
}

@end
