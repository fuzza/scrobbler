//
//  LFSCountry.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/27/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFSCountry : NSObject

- (instancetype)initWithName:(NSString *)name
                   imageName:(NSString *)imageName;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *imageName;

+ (NSArray <LFSCountry *> *)countries;

@end
