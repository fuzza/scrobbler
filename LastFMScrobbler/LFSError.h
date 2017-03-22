//
//  LFSError.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface LFSError : MTLModel

@property (nonatomic, readonly) NSInteger code;
@property (nonatomic, readonly) NSString *message;


@end
