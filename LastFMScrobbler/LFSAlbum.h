//
//  LFSAlbum.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "LFSArtist.h"

@interface LFSAlbum : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSString *uid;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger playcount;

@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) LFSArtist *artist;

@property (nonatomic, readonly) NSArray <LFSImage *> *images;

@end
