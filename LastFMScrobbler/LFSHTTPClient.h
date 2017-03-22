//
//  LFSHTTPClient.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>
#import "LFSAPIRequestExecutor.h"

@interface LFSHTTPClient : AFHTTPSessionManager <LFSAPIRequestExecutor>

- (instancetype)initWithBaseURL:(NSURL *)url apiKey:(NSString *)apiKey;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithBaseURL:(NSURL *)url NS_UNAVAILABLE;
- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)configuration NS_UNAVAILABLE;
- (instancetype)initWithBaseURL:(NSURL *)url
           sessionConfiguration:(NSURLSessionConfiguration *)configuration NS_UNAVAILABLE;

@end
