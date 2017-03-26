//
//  LFSAppScope.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSAppScope.h"
#import "LFSHTTPClient.h"
#import "LFSAPIFacade.h"

@implementation LFSAppScope

- (void)configure {
    [self.container bindEagerSingletoneBlock:^id{
        LFSHTTPClient *client = [[LFSHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://ws.audioscrobbler.com/2.0/"]
                                                               apiKey:@"e81f61890b7ff8633ca024d0faa449e7"];
        return [[LFSAPIFacade alloc] initWithExecutor:client];
    } toProtocol:@protocol(LFSAPIFacadeProtocol)];
}

@end
