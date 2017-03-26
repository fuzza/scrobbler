//
//  LFSViewModel.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Foundation/Foundation.h>

@class LFSRouter;
@class RACCommand;
@class RACSignal;

@interface LFSCollectionViewModel <Model> : NSObject

- (instancetype)initWithRouter:(LFSRouter *)router;

@property (nonatomic, weak, readonly) LFSRouter *router;

@property (nonatomic, readonly) NSString *title;

@property (nonatomic, readonly) NSArray <Model> *items;

@property (nonatomic, readonly) RACCommand *reloadCommand;
@property (nonatomic, readonly) RACCommand *loadMoreCommand;

@property (nonatomic, readonly) RACSignal *hudSignal;

@property (nonatomic, readonly) NSUInteger page;

- (void)didSelectItem:(Model)item;
- (RACSignal *)loadingSignal;

@end
