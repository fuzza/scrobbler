//
//  LFSArtist.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "LFSImage.h"

@interface LFSArtist : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSString *uid;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger listeners;

@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) BOOL isStreamable;

@property (nonatomic, readonly) NSArray <LFSImage *> *images;

@end
