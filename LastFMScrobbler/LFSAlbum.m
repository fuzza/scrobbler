//
//  LFSAlbum.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSAlbum.h"

@implementation LFSAlbum

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"uid" : @"mbid",
             @"url" : @"url",
             @"playcount" : @"playcount",
             @"artist" : @"artist",
             @"images" : @"image"
             };
}

+ (NSValueTransformer *)playcountJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSNumber *(NSString *playcountString, BOOL *success, NSError *__autoreleasing *error) {
        return @(playcountString.integerValue);
    } reverseBlock:^id(NSNumber *playcount, BOOL *success, NSError *__autoreleasing *error) {
        return playcount.stringValue;
    }];
}

+ (NSValueTransformer *)artistJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[LFSArtist class]];
}

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)imagesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[LFSImage class]];
}


@end
