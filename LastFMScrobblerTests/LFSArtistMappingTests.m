//
//  LFSArtistMappingTests.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/21/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LFSArtist.h"
#import <Mantle/Mantle.h>
#import <Expecta/Expecta.h>

@interface LFSArtistMappingTests : XCTestCase

@property (nonatomic, strong) NSDictionary *fixture;
@property (nonatomic, strong) LFSArtist *sut;

@end

@implementation LFSArtistMappingTests

- (void)setUp {
    [super setUp];
    
    //TODO in real implementation this will be extracted to separate helper class as a part of test tooling framework
    NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"artist_fixture" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    self.fixture = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSError *error = nil;
    self.sut = [MTLJSONAdapter modelOfClass:[LFSArtist class]
                         fromJSONDictionary:self.fixture
                                      error:&error];
}

- (void)test_createInstanceOfClass {
    expect(self.sut).notTo.beNil();
    expect(self.sut).beKindOf([LFSArtist class]);
}

- (void)test_isMappedCorrectly {
    expect(self.sut.uid).equal(@"a74b1b7f-71a5-4011-9441-d0b5e4122711");
    expect(self.sut.url).equal([NSURL URLWithString:@"https://www.last.fm/music/Radiohead"]);
    expect(self.sut.listeners).equal(4547605);
    expect(self.sut.isStreamable).beTruthy();
    expect(self.sut.images).haveCountOf(5);
    expect(self.sut.images.firstObject).beKindOf([LFSImage class]);
}

@end
