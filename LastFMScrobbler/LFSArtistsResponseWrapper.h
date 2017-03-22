//
//  LFSArtistsResponseWrapper.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "LFSArtist.h"

//TODO: Currently this class simply stores model array, but it can be used to map response metadata, such as total count of artists, count of pages available etc.
@interface LFSArtistsResponseWrapper : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSArray <LFSArtist *> *artists;

@end
