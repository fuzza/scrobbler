//
//  AppDelegate.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <CriolloKitDI/CRDIInjector.h>
#import "LFSAppScope.h"

#import "LFSAppDelegate.h"
#import "LFSRouter.h"

@interface LFSAppDelegate ()

@property (nonatomic, strong) LFSRouter *router;

@end

@implementation LFSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupDependencyInjection];
    [self setupWindow];
    return YES;
}

- (void)setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    self.router = [[LFSRouter alloc] initWithNavigationController:navigationController];
    [self.router showRootScreen];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
}

- (void)setupDependencyInjection {
    CRDIContainer *defaultContainer = [CRDIContainer new];
    [CRDIContainer setDefaultContainer:defaultContainer];
    
    LFSAppScope *appScope = [[LFSAppScope alloc] initWithContainer:defaultContainer];
    [appScope configure];

    CRDIInjector *injector = [[CRDIInjector alloc] initWithContainer:defaultContainer];
    [CRDIInjector setDefaultInjector:injector];
}

@end
