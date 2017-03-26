//
//  LFSAlbumsViewModel.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LFSAlbumsViewModel.h"
#import "LFSArtist.h"
#import "LFSAPIFacade.h"

@interface LFSAlbumsViewModel ()

@property (nonatomic, readonly) id <LFSAPIFacadeProtocol> ioc_api;
@property (nonatomic, strong) LFSArtist *artist;

@property (nonatomic, readwrite) NSString *title;

@end

@implementation LFSAlbumsViewModel
@synthesize title;

- (instancetype)initWithRouter:(LFSRouter *)router artist:(LFSArtist *)artist {
    self = [super initWithRouter:router];
    if(self) {
        self.artist = artist;
        [self setupBindings];
    }
    return self;
}

- (void)setupBindings {
    RAC(self, title) = RACObserve(self, artist.name);
}

- (RACSignal *)loadingSignal {
    return [self.ioc_api topAlbumsByArtist:self.artist page:self.page];
}

@end
