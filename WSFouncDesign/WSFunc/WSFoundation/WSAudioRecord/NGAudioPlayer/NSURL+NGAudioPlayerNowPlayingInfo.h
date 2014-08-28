//
//  NSURL+NGAudioPlayerNowPlayingInfo.h
//  NGAudioPlayer
//
//  Created by Matthias Tretter on 29.06.12.
//  Copyright (c) 2012 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURL (NGAudioPlayerNowPlayingInfo)

@property (nonatomic, copy, setter = ng_setNowPlayingInfo:) NSDictionary *ng_nowPlayingInfo;

@end
