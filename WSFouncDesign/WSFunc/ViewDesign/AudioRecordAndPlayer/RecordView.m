//
//  RecordView.m
//  doctorApp
//
//  Created by wangsen on 14-7-21.
//  Copyright (c) 2014年 richardYang. All rights reserved.
//

#import "RecordView.h"
#define kBgColor [UIColor colorWithRed:30/255.0 green:133/255.0 blue:213/255.0 alpha:1.0]
@interface RecordView()<WSAudioRecordManagerDelegate>
{
    UIView *_contentView;
    unsigned int _sumTime;
    unsigned int _currentPlayTime;
    NSTimer *_timer;//计时器
    
    UILabel *_timeLabel;
    UIView *_bottomView;//录音后
    UIView *_bottomView2;//录音前
    
    
    UIButton *_beginRecordButton;
    UIButton *_endRecordButton;
    
    UIButton *_listenPlayerButton;
    
}
@end
@implementation RecordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        // Initialization code
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 310)];
        _contentView.center = CGPointMake(self.center.x, self.center.y - 30);
        [self addSubview:_contentView];
        self.manager = [[WSAudioRecordManager alloc] init];
        self.manager.delegate = self;
        [self initMyView];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
- (void)initMyView
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _contentView.frame.size.width, 44)];
    titleLabel.backgroundColor = kBgColor;
    titleLabel.text = @"录音";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [_contentView addSubview:titleLabel];
    
    UIButton *closteButton = [[UIButton alloc] initWithFrame:CGRectMake(_contentView.frame.size.width - 40, 10, 30, 30)];
    [closteButton setImage:[UIImage imageNamed:@"recordClose.png"] forState:UIControlStateNormal];
    [closteButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:closteButton];
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height - titleLabel.frame.size.height - 80)];
    _timeLabel = timeLabel;
    [timeLabel setText:@"00:00"];
    timeLabel.textColor = [UIColor whiteColor];
    [timeLabel setFont:[UIFont systemFontOfSize:50]];
    [timeLabel setBackgroundColor:kBgColor];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel = timeLabel;
    [_contentView addSubview:timeLabel];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, _contentView.frame.size.height - 80, _contentView.frame.size.width, 80)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [_contentView addSubview:bottomView];
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(23, 15, 60, 50)];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setBackgroundImage:[UIImage imageNamed:@"recordButtonBG.png"] forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomView addSubview:sureButton];
    
    UIButton *listenButton = [[UIButton alloc] initWithFrame:CGRectMake(106, 15, 60, 50)];
    [listenButton setTitle:@"试听" forState:UIControlStateNormal];
    [listenButton setTitle:@"停止" forState:UIControlStateSelected];
    _listenPlayerButton = listenButton;
    [listenButton setBackgroundImage:[UIImage imageNamed:@"recordButtonBG.png"] forState:UIControlStateNormal];
    [listenButton addTarget:self action:@selector(listenButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [listenButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomView addSubview:listenButton];
    
    UIButton *cancleButton = [[UIButton alloc] initWithFrame:CGRectMake(189, 15, 60, 50)];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setBackgroundImage:[UIImage imageNamed:@"recordButtonBG.png"] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomView addSubview:cancleButton];
    _bottomView = bottomView;
    bottomView.hidden = YES;
    
    UIView *bottonView2 = [[UIView alloc] initWithFrame:CGRectMake(0, _contentView.frame.size.height - 80, _contentView.frame.size.width, 80)];
    bottonView2.backgroundColor = [UIColor whiteColor];
    UIButton *beginAndPauseRecordBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 10, 42, 65)];
    [beginAndPauseRecordBtn setImage:[UIImage imageNamed:@"beginRecord.png"] forState:UIControlStateNormal];
    _beginRecordButton = beginAndPauseRecordBtn;
    [beginAndPauseRecordBtn setImage:[UIImage imageNamed:@"pauseRecord.png"] forState:UIControlStateSelected];
    [beginAndPauseRecordBtn addTarget:self action:@selector(beginAndPauseRecordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bottonView2 addSubview:beginAndPauseRecordBtn];
    
    UIButton *endButton = [[UIButton alloc] initWithFrame:CGRectMake(178, 10, 42, 65)];
    [endButton addTarget:self action:@selector(endButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _endRecordButton = endButton;
    endButton.enabled = NO;
    [endButton setImage:[UIImage imageNamed:@"endRecord.png"] forState:UIControlStateNormal];
    
    _bottomView2 = bottonView2;
    [bottonView2 addSubview:endButton];
    [_contentView addSubview:bottonView2];
    //    bottonView2.hidden = YES;
    
}
- (void)closeButtonClick:(UIButton *)button
{
    NSLog(@"关闭");
    [self removeFromSuperview];
}
#pragma mark -开始／暂停按钮
- (void)beginAndPauseRecordBtnClick:(UIButton *)button
{
    NSLog(@"开始录音");
    static int firstIn = YES;
    _endRecordButton.enabled = YES;
    if (!button.selected) {
        if (_timer == nil || firstIn) {
            [self.manager beginRecorder];
            _timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(currendRecordTime) userInfo:nil repeats:YES];
            [[NSRunLoop  currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
            firstIn = NO;
        }
        else
        {
            [self.manager continueRecordFromPause];
        }
        button.selected = YES;
    }
    else
    {
        [self.manager pauseRecorder];
        [_beginRecordButton setImage:[UIImage imageNamed:@"continueRecord.png"] forState:UIControlStateNormal];
        button.selected = NO;
    }
}
#pragma mark -结束录音
- (void)endButtonClick:(UIButton *)button
{
    NSLog(@"结束录音");
    [self.manager endRecorder];
    [_bottomView2 setHidden:YES];
    [_bottomView setHidden:NO];
    [_timer invalidate];
    _timer = nil;
    
    
}
//格式化当前录音时长为时间格式
- (void)currendRecordTime
{
    if ([self.manager currentRecorderTime]) {
        _sumTime = [self.manager currentRecorderTime];
    }
    int min = _sumTime / 60;
    int sec = _sumTime % 60 ;
    [_timeLabel setFont:[UIFont systemFontOfSize:50]];
    _timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",min,sec];
    
    
}
#pragma mark -确定按钮
- (void)sureButtonClick:(UIButton *)button
{
    [self.manager stopRecorderPlay];
    if ([self.delegate respondsToSelector:@selector(sureClick:andRecordPath:)]) {
        [self.delegate sureClick:nil andRecordPath:self.manager.tempPathStr];
    }
    [self removeFromSuperview];
}
#pragma mark -试听／停止 按钮
- (void)listenButtonClick:(UIButton *)button
{
    if (!button.selected) {
        [self.manager playRecorderWithStringPath:self.manager.tempPathStr];
        _timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(currentPlayerTimeSetting) userInfo:nil repeats:YES];
        [[NSRunLoop  currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    }
    else
    {
        [self.manager stopRecorderPlay];
        [_timer invalidate];
        _timer = nil;
        [self currendRecordTime];
    }
    button.selected = !button.selected;
    
}
- (void)currentPlayerTimeSetting
{
    int currentPlayerTime = [self.manager currentPlayTime];
    [_timeLabel setFont:[UIFont systemFontOfSize:25]];
    _timeLabel.text = [NSString stringWithFormat:@"%02d:%02d/%02d:%02d",currentPlayerTime/60,currentPlayerTime%60,_sumTime/60,_sumTime%60];
}
#pragma mark -取消按钮
- (void)cancleButtonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(cancleClick:)]) {
        [self.delegate cancleClick:nil];
    }
    [self removeFromSuperview];
}
#pragma mark - WSAudioRecordManagerDelegate
- (void)endPlayDo
{
    _listenPlayerButton.selected = NO;
    [_timer invalidate];
    _timer = nil;
    [self currendRecordTime];
}
@end
