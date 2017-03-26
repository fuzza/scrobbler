//
//  LFSViewModel.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <CriolloKitDI/CRDIInjector.h>
#import "LFSCollectionViewModel.h"
#import "LFSRouter.h"

@interface LFSCollectionViewModel ()

@property (nonatomic, weak, readwrite) LFSRouter *router;
@property (nonatomic, readwrite) NSArray *items;

@property (nonatomic, readwrite) RACCommand *reloadCommand;
@property (nonatomic, readwrite) RACCommand *loadMoreCommand;

@property (nonatomic, readwrite) RACSignal *hudSignal;

@property (nonatomic, strong) NSString *country;
@property (nonatomic, assign) NSUInteger page;

@end

@implementation LFSCollectionViewModel

- (instancetype)initWithRouter:(LFSRouter *)router {
    self = [super init];
    if(self) {
        [[CRDIInjector defaultInjector] injectTo:self];
        self.router = router;
        [self setupDefaults];
        [self setupCommands];
        [self setupErrorHandler];
        [self setupHudSignal];
    }
    return self;
}

#pragma mark - Setup

- (void)setupDefaults {
    self.items = @[];
    self.page = 1;
}

- (void)setupCommands {
    @weakify(self);
    RACSignal *(^reloadSignalBlock)(id) = ^RACSignal *(id input){
        @strongify(self);
        [self resetPage];
        return [[self loadingSignal] doNext:^(NSArray *items) {
            [self didLoadPageWithItems:items];
        }];
    };
    
    self.reloadCommand = [[RACCommand alloc] initWithSignalBlock:reloadSignalBlock];
    
    
    RACSignal *(^loadMoreSignalBlock)(id) = ^RACSignal *(id input){
        @strongify(self);
        return [[[self loadingSignal] takeUntil:[self.reloadCommand.executing ignore:@NO]] doNext:^(NSArray *items) {
            [self didLoadPageWithItems:[self.items arrayByAddingObjectsFromArray:items]];
        }];
    };
    self.loadMoreCommand = [[RACCommand alloc] initWithEnabled:[self.reloadCommand.executing not]
                                                   signalBlock:loadMoreSignalBlock];
}

- (void)setupErrorHandler {
    RACSignal *errorsSignal = [[RACSignal merge:@[self.loadMoreCommand.errors, self.reloadCommand.errors]] deliverOnMainThread];
    [self.router rac_liftSelector:@selector(showAlertForError:)
             withSignalsFromArray:@[errorsSignal]];
}

- (void)setupHudSignal {
    RACSignal *executingSignal = [RACSignal merge:@[self.loadMoreCommand.executing, self.reloadCommand.executing]];
    
    RACSignal *emptyItemsSignal = [RACObserve(self, items) map:^id(NSArray *items) {
        return @(items.count == 0);
    }];
    
    self.hudSignal = [[RACSignal combineLatest:@[executingSignal, emptyItemsSignal]] and];
}

#pragma mark - Pagination

- (void)resetPage {
    self.page = 1;
}

- (void)didLoadPageWithItems:(NSArray *)items {
    self.items = items;
    self.page++;
}

#pragma mark - Subclassing Hooks

- (RACSignal *)loadingSignal {
    NSAssert(NO, @"Should be overrided by subclass");
    return nil;
}

- (void)didSelectItem:(id)item {
    //Do nothing
}

@end
