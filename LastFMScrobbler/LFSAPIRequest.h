//
//  LFSAPIRequest.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <Mantle/Mantle.h>

@protocol LFSAPIRequest <MTLJSONSerializing>

@property (nonatomic, readonly) NSString *method;

+ (Class)responseClass;

@end

@protocol LFSPaginatedRequest <LFSAPIRequest>

@property (nonatomic, readonly) NSInteger limit;
@property (nonatomic, readonly) NSInteger page;

@end
