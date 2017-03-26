//
//  LFSCountry.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/27/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSCountry.h"

@implementation LFSCountry

+ (NSArray<LFSCountry *> *)countries {
    return @[
             [[LFSCountry alloc] initWithName:@"United States" imageName:@"US"],
             [[LFSCountry alloc] initWithName:@"United Kingdom" imageName:@"GB"],
             [[LFSCountry alloc] initWithName:@"Germany" imageName:@"DE"],
             ];
}

- (instancetype)initWithName:(NSString *)name
                   imageName:(NSString *)imageName {
    self = [super init];
    if(self) {
        _name = name;
        _imageName = imageName;
    }
    return self;
}

@end
