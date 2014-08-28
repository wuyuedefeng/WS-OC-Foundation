//
//  WSAudioRecordManager.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-18.
//  Copyright (c) 2014年 wangsen. All rights reserved.
//
#import "WSAudioRecordManager.h"
@interface WSAudioRecordManager()<AVAudioPlayerDelegate>
{
    AVAudioRecorder *_audioRecorder;//录音
    AVAudioPlayer *_audioPlayer;//播放录音
    
    NSString *_recordDirectoryPath;//录音保存路径
    NSString *_recordName;//录音的名称
}
@end


static WSAudioRecordManager *__audioRecordManager;
@implementation WSAudioRecordManager

+ (id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self)
    {
        if (!__audioRecordManager) {
            __audioRecordManager = [super allocWithZone:zone];
        }
        return __audioRecordManager;
    }
}
+ (id)shareAudioRecordManager
{
    if (__audioRecordManager) {
        return __audioRecordManager;
    }
    __audioRecordManager = [[WSAudioRecordManager alloc] init];
    return __audioRecordManager;
}
- (id)init
{
    if (self = [super init]) {
    }
    return self;
}
#pragma mark -获取当前录音时长
- (NSTimeInterval)currentRecorderTime
{
    return _audioRecorder.currentTime;
}
#pragma mark -获取播放文件的当前播放位置的时间
- (NSTimeInterval)currentPlayTime
{
    return _audioPlayer.currentTime;
}
#pragma mark - 录音功能
#pragma mark -开始录音1
- (void)beginRecorder
{
    [self beginRecorder_recordDirectoryPath:nil recordName:nil recordSetting:nil];
    //录音开始
    if ([_audioRecorder prepareToRecord]) {
        [_audioRecorder record];
    }
}

#pragma mark -开始录音2
- (void)beginRecorder_recordDirectoryPath:(NSString *)path recordName:(NSString *)name recordSetting:(NSDictionary *)setting
{
    if (path == nil || [path isEqualToString:@""]) {
        path = [self getSaveRecordDirectoryPath];
    }
    if (name == nil || [name isEqualToString:@""]) {
        name = [self getSaveRecordName];
    }
    if(setting == nil)
    {
        setting = [self getRecordSetting];
    }
    //拼接成录音保存完整路径
    NSString *recorderFullPath = [path stringByAppendingFormat:@"/%@",name];
    self.tempPathStr = recorderFullPath;
    NSLog(@"=%@",recorderFullPath);
    //将路径转换成URL
    NSURL *recordUrl = [[NSURL alloc] initFileURLWithPath:recorderFullPath];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    _audioRecorder = [[AVAudioRecorder alloc] initWithURL:recordUrl settings:setting error:nil];
    //录音开始
    if ([_audioRecorder prepareToRecord]) {
        [_audioRecorder record];
    }
}
#pragma mark -暂停录音
- (void)pauseRecorder
{
    if ([_audioRecorder isRecording]) {
        [_audioRecorder pause];
    }
}
#pragma mark -暂停后继续录音
- (void)continueRecordFromPause
{
    [_audioRecorder record];
}
#pragma mark -结束录音
- (void)endRecorder
{
    //if ([_audioRecorder isRecording]) {
    [_audioRecorder stop];
    //}
}

#pragma mark - 对录音功能对设置
#pragma mark --对保存路径进行设置(创建默认文件保存文件夹)
- (NSString *)getSaveRecordDirectoryPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *recorderGroupPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    recorderGroupPath = [recorderGroupPath stringByAppendingString:@"/voice"];
    if (![fileManager fileExistsAtPath:recorderGroupPath]) {
        NSLog(@"没有此路径");
        [fileManager createDirectoryAtPath:recorderGroupPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"===%@",recorderGroupPath);
    return recorderGroupPath;
}
#pragma mark --设置文件保存名称（对默认文件名称进行设置）
- (NSString *)getSaveRecordName
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *recorderName = [NSString stringWithFormat:@"%@.wav",[dateFormatter stringFromDate:[NSDate date]]];
    return recorderName;
}
#pragma mark --对音频文件格式进行设置
- (NSDictionary*)getRecordSetting
{
    //录音设置
    NSMutableDictionary *recordSettingDic = [NSMutableDictionary dictionary];
    //设置录音格式  AVFormatIDKey
    [recordSettingDic setObject:[NSNumber numberWithInt: kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    //设置录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
    [recordSettingDic setObject:[NSNumber numberWithFloat: 8000.0] forKey:AVSampleRateKey];
    //录音通道数  1 或 2
    [recordSettingDic setObject:[NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey];
    //是否为大端（大端还是小端 是内存的组织）
    [recordSettingDic setObject:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
    //线性采样位数  8、16、24、32(采样位数 默认 16)
    [recordSettingDic setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //音频编码质量
    [recordSettingDic setObject:[NSNumber numberWithInt:AVAudioQualityMedium] forKey:AVEncoderAudioQualityKey];
    return recordSettingDic;
}
#pragma mark - ＝＝＝＝＝＝＝＝＝＝＝＝切分＝＝＝＝＝＝＝＝＝＝＝＝
#pragma mark - 播放录音功能
- (void)playRecorderWithStringPath:(NSString *)strPath
{
    //设置自动切换听筒和扬声器
    [self setupSoundPlayerStyle];
    
    NSURL *fileUrl = [[NSURL alloc] initFileURLWithPath:strPath];
    NSLog(@"fileUrlPath = %@",fileUrl);
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
    [_audioPlayer setDelegate:self];
    _audioPlayer.currentTime = 0;
    
    NSLog(@"持续时间:%f",_audioPlayer.duration);
    if (_audioPlayer.isPlaying || _audioPlayer.duration < 0.1) {
        [_audioPlayer stop];
    }
    else
    {
        [_audioPlayer prepareToPlay];
        NSLog(@"play");
        [_audioPlayer play];
        
    }
}
#pragma mark -设置自动切换听筒和扬声器
- (void)setupSoundPlayerStyle
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_7_0
    //初始化播放器的时候如下设置
    UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory,
                            sizeof(sessionCategory),
                            &sessionCategory);
    
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,
                             sizeof (audioRouteOverride),
                             &audioRouteOverride);
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    //默认情况下扬声器播放
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
#else
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    //默认情况下扬声器播放
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
#endif
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sensorStateChange:)
                                                 name:@"UIDeviceProximityStateDidChangeNotification"
                                               object:nil];
    
}
#pragma mark -处理监听触发事件
-(void)sensorStateChange:(NSNotificationCenter *)notification;
{
    //如果此时手机靠近面部放在耳朵旁，那么声音将通过听筒输出，并将屏幕变暗（省电啊）
    if ([[UIDevice currentDevice] proximityState] == YES)
    {
        NSLog(@"Device is close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        
    }
    else
    {
        NSLog(@"Device is not close to user");
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}
#pragma mark -暂停播放
- (void)pauseRecorderPlayer
{
    if ([_audioPlayer isPlaying]) {
        [_audioPlayer pause];
    }
}
#pragma mark -结束播放
- (void)stopRecorderPlay;
{
    //if ([_audioPlayer isPlaying]) {
    [_audioPlayer stop];
    //}
}
#pragma mark --获取将要播放文件时间的总长度 秒数
- (float)getDurationWithStringPath:(NSString *)strPath
{
    NSURL *fileUrl = [[NSURL alloc] initFileURLWithPath:strPath];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
    return _audioPlayer.duration;
}
#pragma mark - 播放的代理方法<AVAudioPlayerDelegate>
//播放完成
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if ([self.delegate respondsToSelector:@selector(endPlayDo)]) {
        [self.delegate endPlayDo];
    }
    NSLog(@"播放完毕");
}
//电话中断
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
    NSLog(@"被中断");
    [player stop];//停止播放
}
//从中断重恢复
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
    //[player play];
}
@end
