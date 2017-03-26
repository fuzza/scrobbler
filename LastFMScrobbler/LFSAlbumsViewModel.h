//
//  LFSAlbumsViewModel.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSCollectionViewModel.h"

@class LFSArtist;

@interface LFSAlbumsViewModel : LFSCollectionViewModel

- (instancetype)initWithRouter:(LFSRouter *)router artist:(LFSArtist *)artist;

@end
