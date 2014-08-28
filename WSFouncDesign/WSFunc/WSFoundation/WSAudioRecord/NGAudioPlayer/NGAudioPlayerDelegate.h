//
//  NGAudioPlayerDelegate.h
//  NGAudioPlayer
//
//  Created by Matthias Tretter on 21.06.12.
//  Copyright (c) 2012 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NGAudioPlayerPlaybackState.h"


@class NGAudioPlayer;


@protocol NGAudioPlayerDelegate <NSObject>

@optional

- (void)audioPlayer:(NGAudioPlayer *)audioPlayer didStartPlaybackOfURL:(NSURL *)url;
- (void)audioPlayer:(NGAudioPlayer *)audioPlayer didFinishPlaybackOfURL:(NSURL *)url;
- (void)audioPlayer:(NGAudioPlayer *)audioPlayer didFailForURL:(NSURL *)url;
- (void)audioPlayer:(NGAudioPlayer *)audioPlayer didChangeTime:(NSTimeInterval)currentTime;

- (void)audioPlayerDidChangePlaybackState:(NGAudioPlayerPlaybackState)playbackState;

@end
