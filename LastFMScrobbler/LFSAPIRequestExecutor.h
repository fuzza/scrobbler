//
//  LFSAPIRequestExecutor.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol LFSAPIRequest;

@protocol LFSAPIRequestExecutor <NSObject>

- (RACSignal *)performRequest:(id <LFSAPIRequest>)request;

@end
