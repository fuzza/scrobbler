//
//  LFSRequestSerializer.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <AFNetworking/AFURLRequestSerialization.h>

@interface LFSAPIRequestSerializer : AFJSONRequestSerializer

@property (atomic, strong) NSString *apiKey;

@end
