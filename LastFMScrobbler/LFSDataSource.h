//
//  LFSDataSource.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <SSDataSources/SSDataSources.h>

@interface LFSDataSource : SSArrayDataSource

+ (instancetype)albumsDataSource;
+ (instancetype)artistsDataSource;

@end
