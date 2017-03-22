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

- (RACSignal /** NSArray <LFSArtist> */ *)topArtistsByCountry:(NSString *)country
                                                         page:(NSUInteger)page {
    LFSArtistsRequest *request = [[LFSArtistsRequest alloc] initWithCountry:country
                                                                       page:page];
    return [[self.executor performRequest:request] map:^id(LFSArtistsResponseWrapper *wrapper) {
        return wrapper.artists;
    }];
}

- (RACSignal /** NSArray <LFSAlbum> */ *)topAlbumsByArtistUid:(NSString *)uid
                                                         page:(NSUInteger)page {
    LFSAlbumsRequest *request = [[LFSAlbumsRequest alloc] initWithArtistUid:uid
                                                                       page:page];
    return [[self.executor performRequest:request] map:^id(LFSAlbumsResponseWrapper *wrapper) {
        return wrapper.albums;
    }];
}

@end
