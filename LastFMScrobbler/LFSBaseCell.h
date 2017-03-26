//
//  LFSBaseCell.h
//  LastFMScrobbler
//
//  Created by Alex Faizullov on 3/26/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <SSDataSources/SSDataSources.h>

@interface LFSBaseCell <Model> : SSBaseCollectionCell

@property (nonatomic, readonly) Model model;

- (void)updateWithModel:(Model)model NS_REQUIRES_SUPER;

@end
