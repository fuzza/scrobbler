//
//  LFSArtistsViewModel.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/24/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSArtistsViewModel.h"
#import "LFSRouter.h"
#import "LFSAPIFacade.h"
#import "LFSArtist.h"
#import "LFSCountry.h"

@interface LFSArtistsViewModel ()

@property (nonatomic, readwrite) NSArray <LFSArtist *> *items;
@property (nonatomic, readonly) id <LFSAPIFacadeProtocol> ioc_api;
@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSArray <LFSCountry *> *countries;
@property (nonatomic, strong) LFSCountry *selectedCountry;

@end

@implementation LFSArtistsViewModel
@synthesize title;
@synthesize items;

- (instancetype)initWithRouter:(LFSRouter *)router {
    self = [super initWithRouter:router];
    if(self) {
        self.title = NSLocalizedString(@"Popular artists", nil);
        self.countries = [LFSCountry countries];
        self.selectedCountry = self.countries.firstObject;
    
        [self setupBindings];
    }
    return self;
}

- (RACSignal *)loadingSignal {
    return [self.ioc_api topArtistsByCountry:self.selectedCountry
                                        page:self.page];
}

- (void)didSelectItem:(LFSArtist *)item {
    [self.router showAlbumsOfArtist:item];
}

- (void)setupBindings {
    @weakify(self);
    [[[RACObserve(self, selectedCountry) distinctUntilChanged] skip:1] subscribeNext:^(id x) {
        @strongify(self);
        self.items = @[];
        [self.reloadCommand execute:nil];
    }];
}

- (void)didSelectFilter {
    @weakify(self);
    [self.router showFilterWithCountries:self.countries
                                callback:^(LFSCountry *country) {
        @strongify(self);
        self.selectedCountry = country;
    }];
}

@end
