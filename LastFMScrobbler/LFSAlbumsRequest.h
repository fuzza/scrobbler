//
//  LFSAlbumsRequest.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "LFSAPIRequest.h"

@interface LFSAlbumsRequest : MTLModel <LFSPaginatedRequest>

- (instancetype)initWithArtistUid:(NSString *)uid
                             page:(NSUInteger)page;

@property (nonatomic, readonly) NSString *artistUid;

@end
