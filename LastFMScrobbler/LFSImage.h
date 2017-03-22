//
//  LFSImage.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>

typedef NS_ENUM(NSInteger, LFSImageSize) {
    LFSImageSizeUnknown = 0,
    LFSImageSizeSmall,
    LFSImageSizeMedium,
    LFSImageSizeLarge,
    LFSImageSizeExtraLarge,
    LFSImageSizeMega
};

@interface LFSImage : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) LFSImageSize size;

@end
