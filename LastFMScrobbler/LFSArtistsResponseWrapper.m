//
//  LFSArtistsResponseWrapper.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSArtistsResponseWrapper.h"

@implementation LFSArtistsResponseWrapper

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"artists" : @"topartists.artist"
             };
}

+ (NSValueTransformer *)artistsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[LFSArtist class]];
}

@end
