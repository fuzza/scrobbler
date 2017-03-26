//
//  LFSArtist.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LFSArtist.h"

@implementation LFSArtist

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"uid" : @"mbid",
             @"url" : @"url",
             @"listeners" : @"listeners",
             @"isStreamable" : @"streamable",
             @"images" : @"image"
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSNumber *(NSString *listenersString, BOOL *success, NSError *__autoreleasing *error) {
        return @(listenersString.integerValue);
    } reverseBlock:^id(NSNumber *listeners, BOOL *success, NSError *__autoreleasing *error) {
        return listeners.stringValue;
    }];
}

+ (NSValueTransformer *)isStreamableJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSNumber *(NSString *isStreamableString, BOOL *success, NSError *__autoreleasing *error) {
        return @(isStreamableString.boolValue);
    } reverseBlock:^id(NSNumber *isStreamable, BOOL *success, NSError *__autoreleasing *error) {
        return isStreamable.stringValue;
    }];
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
