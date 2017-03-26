//
//  LFSAPIFacade.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol LFSAPIRequestExecutor;
@class LFSCountry;
@class LFSArtist;

@protocol LFSAPIFacadeProtocol <NSObject>
- (RACSignal /** NSArray <LFSArtist> */ *)topArtistsByCountry:(LFSCountry *)country
                                                         page:(NSUInteger)page;

- (RACSignal /** NSArray <LFSAlbum> */ *)topAlbumsByArtist:(LFSArtist *)artist
                                                      page:(NSUInteger)page;
@end

@interface LFSAPIFacade : NSObject <LFSAPIFacadeProtocol>

- (instancetype)initWithExecutor:(id <LFSAPIRequestExecutor>)executor;

@end
