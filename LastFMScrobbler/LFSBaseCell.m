//
//  LFSBaseCell.m
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import "LFSBaseCell.h"

@interface LFSBaseCell ()

@property (nonatomic, readwrite) id model;

@end

@implementation LFSBaseCell

- (void)updateWithModel:(id)model {
    self.model = model;
}

@end
