//
//  WSAudioRecordManager.h
//  WSFouncDesign
//
//  Created by wangsen on 14-7-18.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//
/**
 *录音功能等
 *WSAudioRecordManager
 *框架支持：AVFoundation CoreAudio
 **/
#import <Foundation/Foundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>

@protocol WSAudioRecordManagerDelegate<NSObject>

//播放结束调用方法
- (void)endPlayDo;

@end


@interface WSAudioRecordManager : NSObject
#pragma mark - 临时变量（保存最近一次录音的全路径 包括文件名和后缀）

@property (nonatomic,copy)NSString *tempPathStr;
#pragma mark -获取当前录音时长
@property (nonatomic,readonly,assign)NSTimeInterval currentRecorderTime;//当前录音位置时长
#pragma mark -获取当前播放时长
@property (nonatomic,readonly,assign)NSTimeInterval currentPlayTime;//当前播放位置时长
//代理方法
@property (nonatomic,strong)id<WSAudioRecordManagerDelegate>delegate;


#pragma mark - 录音功能
#pragma mark -开始录音
- (void)beginRecorder;
- (void)beginRecorder_recordDirectoryPath:(NSString *)path recordName:(NSString *)name recordSetting:(NSDictionary *)setting;
#pragma mark -暂停录音
- (void)pauseRecorder;
#pragma mark -暂停后继续录音
- (void)continueRecordFromPause;
#pragma mark -结束录音
- (void)endRecorder;

#pragma mark - 播放功能
#pragma mark -开始播放
- (void)playRecorderWithStringPath:(NSString *)strPath;
#pragma mark -暂停播放
- (void)pauseRecorderPlayer;
#pragma mark -结束播放
- (void)stopRecorderPlay;
#pragma mark -获取音频文件时间长度 秒数
- (float)getDurationWithStringPath:(NSString *)strPath;

+ (id)shareAudioRecordManager;
@end
