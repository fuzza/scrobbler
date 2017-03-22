//
//  LFSAPIFacade.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <AppleGuice/AppleGuice.h>
#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol LFSAPIRequestExecutor;

@protocol LFSAPIFacadeProtocol <NSObject>
- (RACSignal /** NSArray <LFSArtist> */ *)topArtistsByCountry:(NSString *)country
                                                         page:(NSUInteger)page;

- (RACSignal /** NSArray <LFSAlbum> */ *)topAlbumsByArtistUid:(NSString *)uid
                                                         page:(NSUInteger)page;
@end

@interface LFSAPIFacade : NSObject <LFSAPIFacadeProtocol>

- (instancetype)initWithExecutor:(id <LFSAPIRequestExecutor>)executor;

@end
