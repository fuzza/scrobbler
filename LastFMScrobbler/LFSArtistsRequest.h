//
//  LFSArtistsRequest.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "LFSAPIRequest.h"

@interface LFSArtistsRequest : MTLModel <LFSPaginatedRequest>

- (instancetype)initWithCountry:(NSString *)country
                           page:(NSUInteger)page;

@property (nonatomic, readonly) NSString *country;

@end
