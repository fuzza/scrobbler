//
//  LFSAlbumsResponseWrapper.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/22/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSAlbumsResponseWrapper.h"

@implementation LFSAlbumsResponseWrapper

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"albums" : @"topalbums.album"
             };
}

+ (NSValueTransformer *)albumsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[LFSAlbum class]];
}

@end
