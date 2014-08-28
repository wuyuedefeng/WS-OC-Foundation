//
//  NSURL+NGAudioPlayerNowPlayingInfo.m
//  NGAudioPlayer
//
//  Created by Matthias Tretter on 29.06.12.
//  Copyright (c) 2012 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import "NSURL+NGAudioPlayerNowPlayingInfo.h"
#import <objc/runtime.h>


static char nowPlayingKey;


@implementation NSURL (NGAudioPlayerNowPlayingInfo)

////////////////////////////////////////////////////////////////////////
#pragma mark - NSURL+NGAudioPlayerNowPlayingInfo
////////////////////////////////////////////////////////////////////////

- (void)ng_setNowPlayingInfo:(NSDictionary *)ng_nowPlayingInfo {
    objc_setAssociatedObject(self, &nowPlayingKey, ng_nowPlayingInfo, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)ng_nowPlayingInfo {
    return objc_getAssociatedObject(self, &nowPlayingKey);
}

@end
