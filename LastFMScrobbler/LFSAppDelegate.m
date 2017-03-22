//
//  AppDelegate.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "LFSAppDelegate.h"

#import "LFSHTTPClient.h"
#import "LFSAPIFacade.h"
#import "LFSArtist.h"

@interface LFSAppDelegate ()

@property (nonatomic, strong) LFSAPIFacade *apiClient;

@end

@implementation LFSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    LFSHTTPClient *client = [[LFSHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://ws.audioscrobbler.com/2.0/"] apiKey:@"e81f61890b7ff8633ca024d0faa449e7"];
    self.apiClient = [[LFSAPIFacade alloc] initWithExecutor:client];
    
    return YES;
}

@end
