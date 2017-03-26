//
//  LFSAlbum.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
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

#pragma mark - Calculated

- (NSURL *)defaultImageURL {
    return [[self.images.rac_sequence filter:^BOOL(LFSImage *image) {
        return image.size == LFSImageSizeLarge;
    }] map:^id(LFSImage *image) {
        return image.url;
    }].array.firstObject;
}

@end
