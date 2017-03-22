//
//  LFSAlbumsResponseWrapper.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/22/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "LFSAlbum.h"

//TODO: Currently this class simply stores model array, but it can be used to map response metadata, such as total count of artists, count of pages available etc.
@interface LFSAlbumsResponseWrapper : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSArray <LFSAlbum *> *albums;

@end
