//
//  LFSHTTPClient.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSHTTPClient.h"
#import "LFSAPIRequestSerializer.h"
#import "LFSAPIRequest.h"

@interface LFSHTTPClient ()

@property (nonatomic, strong) LFSAPIRequestSerializer *requestSerializer;

@end

@implementation LFSHTTPClient

@synthesize requestSerializer;

- (instancetype)initWithBaseURL:(NSURL *)url apiKey:(NSString *)apiKey {
    self = [super initWithBaseURL:url];
    if(self) {
        [self setupRequestSerializerWithAPIKey:apiKey];
    }
    return self;
}

- (void)setupRequestSerializerWithAPIKey:(NSString *)apiKey {
    self.requestSerializer = [LFSAPIRequestSerializer new];
    self.requestSerializer.apiKey = apiKey;
}

- (RACSignal *)performRequest:(id<LFSAPIRequest>)request {
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        
        // Here we can add some decision point based on request params which exact kind of HTTP request should be used, but for test task purposes GET is hardcoded.
        NSURLSessionTask *task = [self GET:nil parameters:request success:^(NSURLSessionDataTask * task, id  responseObject) {
            NSError *error = nil;
            id mappedResponse =  [MTLJSONAdapter modelOfClass:[request.class responseClass]
                                           fromJSONDictionary:responseObject
                                                        error:&error];
            if(error) {
                [subscriber sendNext:error];
            } else {
                [subscriber sendNext:mappedResponse];
            }
        } failure:^(NSURLSessionDataTask *task, NSError * error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end
