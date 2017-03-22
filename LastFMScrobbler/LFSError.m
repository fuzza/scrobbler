//
//  LFSError.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSError.h"

@implementation LFSError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"code" : @"error",
             @"message" : @"message"
             };
}

@end
