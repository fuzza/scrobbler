//
//  LFSRouter.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSRouter.h"
#import "LFSArtistsViewController.h"
#import "LFSListFlowLayout.h"

#import "LFSAlbumsViewModel.h"
#import "LFSGridFlowLayout.h"
#import "LFSCountry.h"

@interface LFSRouter ()

@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation LFSRouter

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    NSParameterAssert(navigationController);
    self = [super init];
    if(self) {
        self.navigationController = navigationController;
    }
    return self;
}

- (void)showRootScreen {
    LFSArtistsViewModel *viewModel = [[LFSArtistsViewModel alloc] initWithRouter:self];
    LFSDataSource *dataSource = [LFSDataSource artistsDataSource];
    
    LFSListFlowLayout *layout = [LFSListFlowLayout new];
    LFSArtistsViewController *viewController = [[LFSArtistsViewController alloc] initWithViewModel:viewModel
                                                                                              dataSource:dataSource
                                                                                                  layout:layout];
    [self.navigationController pushViewController:viewController animated:NO];
}

- (void)showAlbumsOfArtist:(LFSArtist *)artist {
    LFSAlbumsViewModel *viewModel = [[LFSAlbumsViewModel alloc] initWithRouter:self artist:artist];
    LFSDataSource *dataSource = [LFSDataSource albumsDataSource];
    
    LFSGridFlowLayout *layout = [LFSGridFlowLayout new];
    LFSCollectionViewController *viewController = [[LFSCollectionViewController alloc] initWithViewModel:viewModel
                                                                                              dataSource:dataSource
                                                                                                  layout:layout];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)showFilterWithCountries:(NSArray <LFSCountry *> *)countries
                       callback:(void(^)(LFSCountry *))callback {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Filter", nil)
                                                                        message:NSLocalizedString(@"Select a country", nil)
                                                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (LFSCountry *country in countries) {
        void (^handler)(UIAlertAction *) = ^(UIAlertAction *action) {
            if(callback) {
                callback(country);
            }
        };
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:country.name
                                                         style:UIAlertActionStyleDefault
                                                       handler:handler];
        [controller addAction:action];
    }
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:cancel];
    
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}

- (void)showAlertForError:(NSError *)error {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error", nil)
                                                                        message:error.localizedDescription
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:ok];
    
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}

@end
