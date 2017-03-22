//
//  LFSImage.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSImage.h"

@implementation LFSImage

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"url" : @"#text",
             @"size" : @"size"
             };
}

+ (NSValueTransformer *)urlJSONTransformer {
     return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)sizeJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"small" : @(LFSImageSizeSmall),
                                                                           @"medium" : @(LFSImageSizeMedium),
                                                                           @"large" : @(LFSImageSizeLarge),
                                                                           @"extralarge" : @(LFSImageSizeExtraLarge),
                                                                           @"mega" : @(LFSImageSizeMega)
                                                                           }];
}

@end
