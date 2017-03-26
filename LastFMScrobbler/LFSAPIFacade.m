//
//  LFSAPIFacade.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "LFSAPIFacade.h"
#import "LFSAPIRequestExecutor.h"

#import "LFSArtistsRequest.h"
#import "LFSArtistsResponseWrapper.h"

#import "LFSAlbumsRequest.h"
#import "LFSAlbumsResponseWrapper.h"

#import "LFSHTTPClient.h"
#import "LFSCountry.h"
#import "LFSArtist.h"

@interface LFSAPIFacade ()

@property (nonatomic, strong) id <LFSAPIRequestExecutor> executor;

@end

@implementation LFSAPIFacade

- (instancetype)initWithExecutor:(id <LFSAPIRequestExecutor>)executor {
    self = [super init];
    if(self) {
        self.executor = executor;
    }
    return self;
}

- (RACSignal /** NSArray <LFSArtist> */ *)topArtistsByCountry:(LFSCountry *)country
                                                         page:(NSUInteger)page {
    LFSArtistsRequest *request = [[LFSArtistsRequest alloc] initWithCountry:country.name
                                                                       page:page];
    return [[self.executor performRequest:request] map:^id(LFSArtistsResponseWrapper *wrapper) {
        return wrapper.artists;
    }];
}

- (RACSignal /** NSArray <LFSAlbum> */ *)topAlbumsByArtist:(LFSArtist *)artist
                                                      page:(NSUInteger)page {
    LFSAlbumsRequest *request = [[LFSAlbumsRequest alloc] initWithArtistUid:artist.uid
                                                                       page:page];
    return [[self.executor performRequest:request] map:^id(LFSAlbumsResponseWrapper *wrapper) {
        return wrapper.albums;
    }];
}

@end
