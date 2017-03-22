//
//  LFSAlbumsRequest.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSAlbumsRequest.h"
#import "LFSAlbumsResponseWrapper.h"

@implementation LFSAlbumsRequest

@synthesize page = _page;
@synthesize limit = _limit;
@synthesize method = _method;

- (instancetype)initWithArtistUid:(NSString *)uid
                             page:(NSUInteger)page {
    self = [super init];
    if(self) {
        _artistUid = uid;
        _page = page;
    }
    return self;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"artistUid" : @"mbid",
             @"method" : @"method",
             @"page" : @"page",
             };
}

#pragma mark - LFSAPIRequest

+ (Class)responseClass {
    return [LFSAlbumsResponseWrapper class];
}

- (NSString *)method {
    return @"artist.gettopalbums"; 
}

- (NSInteger)limit {
    return 50;
}

@end
