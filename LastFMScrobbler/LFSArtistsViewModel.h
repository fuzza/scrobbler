//
//  LFSArtistsViewModel.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/24/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSCollectionViewModel.h"
#import "LFSArtist.h"

@class LFSCountry;

@interface LFSArtistsViewModel : LFSCollectionViewModel <LFSArtist *>

@property (nonatomic, readonly) LFSCountry *selectedCountry;

- (void)didSelectFilter;

@end
