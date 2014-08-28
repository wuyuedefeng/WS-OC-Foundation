//
//  RecordView.h
//  doctorApp
//
//  Created by wangsen on 14-7-21.
//  Copyright (c) 2014年 richardYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSAudioRecordManager.h"
@protocol RecordViewDelegate<NSObject>
- (void)cancleClick:(UIButton *)button;
- (void)sureClick:(UIButton *)button andRecordPath:(NSString *)filePath;
@end
@interface RecordView : UIView

@property(nonatomic,strong)id<RecordViewDelegate>delegate;
@property (nonatomic,strong)WSAudioRecordManager *manager;
@end
