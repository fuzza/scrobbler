//
//  ViewController.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>
#import "LFSCollectionViewController.h"

@interface LFSCollectionViewController ()

@property (nonatomic, readwrite) UICollectionView *collectionView;

@property (nonatomic, readwrite) LFSCollectionViewModel *viewModel;
@property (nonatomic, readwrite) LFSDataSource *dataSource;

@property (nonatomic, strong) UICollectionViewLayout *layout;
@property (nonatomic, strong) UIRefreshControl *pullToRefresh;

@end

@implementation LFSCollectionViewController

#pragma mark - UIViewController lifecycle

- (instancetype)initWithViewModel:(LFSCollectionViewModel *)viewModel
                       dataSource:(LFSDataSource *)dataSource
                           layout:(UICollectionViewLayout *)layout {
    self = [super init];
    if(self) {
        self.dataSource = dataSource;
        self.viewModel = viewModel;
        self.layout = layout;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTitle];
    [self setupCollectionView];
    [self setupDataSource];
    [self setupPullToRefresh];
    [self setupProgressHud];
    
    [self setupDefaultAppearance];
    [self.viewModel.reloadCommand execute:nil];
}

#pragma mark - Setup

- (void)setupTitle {
    RAC(self, title) = RACObserve(self.viewModel, title);
}

- (void)setupDefaultAppearance {
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)setupCollectionView {
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:self.layout];
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)setupDataSource {
    self.dataSource.collectionView = self.collectionView;
    [self.dataSource rac_liftSelector:@selector(updateItems:)
                 withSignalsFromArray:@[[RACObserve(self.viewModel, items) deliverOnMainThread]]];
}

- (void)setupPullToRefresh {
    self.pullToRefresh = [[UIRefreshControl alloc] init];
    self.collectionView.refreshControl = self.pullToRefresh;
    self.pullToRefresh.rac_command = self.viewModel.reloadCommand;
}

- (void)setupProgressHud {
    @weakify(self);
    [self.viewModel.hudSignal subscribeNext:^(NSNumber *shouldShowHud) {
        @strongify(self);
        if(shouldShowHud.boolValue) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == self.dataSource.numberOfItems - 1) {
        [self.viewModel.loadMoreCommand execute:nil];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self.dataSource itemAtIndexPath:indexPath];
    if(item) {
        [self.viewModel didSelectItem:item];
    }
}

@end
