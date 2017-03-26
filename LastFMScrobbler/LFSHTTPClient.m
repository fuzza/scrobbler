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
        [self.reachabilityManager startMonitoring];
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
        if(!self.reachabilityManager.isReachable) {
            [subscriber sendError:self.reachabilityError];
            return nil;
        }
        NSURLSessionTask *task = [self GET:@"" parameters:request success:^(NSURLSessionDataTask * task, id  responseObject) {
            NSError *error = nil;
            id mappedResponse =  [MTLJSONAdapter modelOfClass:[request.class responseClass]
                                           fromJSONDictionary:responseObject
                                                        error:&error];
            if(error) {
                [subscriber sendError:error];
            } else {
                [subscriber sendNext:mappedResponse];
                [subscriber sendCompleted];
            }
        } failure:^(NSURLSessionDataTask *task, NSError * error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (NSError *)reachabilityError {
    return [NSError errorWithDomain:NSStringFromClass(self.class)
                               code:-1001
                           userInfo:@{
                                      NSLocalizedDescriptionKey : NSLocalizedString(@"Your internet connection is down", nil)
                                      }];
}

@end
