//
//  SCBrowseViewPage.h
//  ZhongTouBang
//
//  Created by Angzn on 8/13/14.
//  Copyright (c) 2014 Richer VC. All rights reserved.
//


@class SCBrowseViewPage;

@interface SCBrowseViewPage : UIView

@property (nonatomic, readonly, strong) UIView *contentView;

@property (nonatomic, readonly, copy) NSString *reuseIdentifier;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
