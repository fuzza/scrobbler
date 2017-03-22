//
//  LFSRequestSerializer.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "LFSAPIRequest.h"
#import "LFSAPIRequestSerializer.h"

@implementation LFSAPIRequestSerializer

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                 URLString:(NSString *)URLString
                                parameters:(id <LFSAPIRequest>)parameters
                                     error:(NSError *__autoreleasing *)error {
    NSParameterAssert([parameters conformsToProtocol:@protocol(LFSAPIRequest)]);
    
    NSDictionary *parametersDictionary = [MTLJSONAdapter JSONDictionaryFromModel:parameters error:error];
    NSParameterAssert(error);
    
    if(parametersDictionary) {
        NSMutableDictionary *modifiedParameters = [parametersDictionary mutableCopy];
        modifiedParameters[@"format"] = @"json";
        
        if(self.apiKey) {
            modifiedParameters[@"api_key"] = self.apiKey;
        }
        
        return [super requestWithMethod:method URLString:URLString
                             parameters:[modifiedParameters copy]
                                  error:error];
    }
    
    return nil;
}

@end
