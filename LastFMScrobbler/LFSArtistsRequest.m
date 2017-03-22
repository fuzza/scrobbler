//
//  LFSArtistsRequest.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSArtistsRequest.h"
#import "LFSArtistsResponseWrapper.h"

@implementation LFSArtistsRequest

@synthesize page = _page;
@synthesize limit = _limit;
@synthesize method = _method;

- (instancetype)initWithCountry:(NSString *)country
                           page:(NSUInteger)page {
    self = [super init];
    if(self) {
        _country = country;
        _page = page;
    }
    return self;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"country" : @"country",
             @"method" : @"method",
             @"page" : @"page",
             };
}

#pragma mark - LFSAPIRequest

+ (Class)responseClass {
    return [LFSArtistsResponseWrapper class];
}

- (NSString *)method {
    return @"geo.gettopartists";
}

- (NSInteger)limit {
    return 50;
}

@end
