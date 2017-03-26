//
//  LFSRouter.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFSArtist;
@class LFSCountry;

@interface LFSRouter : NSObject

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (void)showRootScreen;
- (void)showAlbumsOfArtist:(LFSArtist *)artist;

- (void)showFilterWithCountries:(NSArray <LFSCountry *> *)counties
                       callback:(void(^)(LFSCountry *))callback;

- (void)showAlertForError:(NSError *)error;

@end
