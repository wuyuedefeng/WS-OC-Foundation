//
//  WSKeyBoardAccessory.m
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-12.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "WSKeyBoardAccessory.h"
#import "WSKeyboardManager.h"
#import "UIView+WSCategory.h"
// 严格单例
#if __has_feature(objc_arc)
#define kWSStrictSingletonForClass(__CLASS_NAME__) \
static __CLASS_NAME__ *shared##__CLASS_NAME__ = nil;\
+ (__CLASS_NAME__ *)shared##__CLASS_NAME__ {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##__CLASS_NAME__ = [[super allocWithZone:NULL] init];\
});\
return shared##__CLASS_NAME__;\
}\
+ (id)allocWithZone:(NSZone *)zone {\
return [__CLASS_NAME__ shared##__CLASS_NAME__];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return self;\
}
#else
#define kWSStrictSingletonForClass(__CLASS_NAME__) \
static __CLASS_NAME__ *shared##__CLASS_NAME__ = nil;\
+ (__CLASS_NAME__ *)shared##__CLASS_NAME__ {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##__CLASS_NAME__ = [[super allocWithZone:NULL] init];\
});\
return shared##__CLASS_NAME__;\
}\
+ (id)allocWithZone:(NSZone *)zone {\
return [__CLASS_NAME__ shared##__CLASS_NAME__];\
}\
- (id)copyWithZone:(NSZone *)zone {\
return self;\
}\
- (id)retain {\
return self;\
}\
- (NSUInteger)retainCount {\
return NSUIntegerMax;\
}\
- (oneway void)release {\
}\
- (id)autorelease {\
return self;\
}
#endif
@interface WSKeyBoardAccessory()
{
    NSArray             *_controlList;                  //输入框数组
    UIBarButtonItem     *_prevButtonItem;               //上一项按钮
    UIBarButtonItem     *_nextButtonItem;               //下一项按钮
    UIBarButtonItem     *_doneButtonItem;               //完成按钮
    UIBarButtonItem     *_spaceButtonItem;              //空白按钮
    id                  _currentControl;                //当前输入框
}
- (void)showPrevious;
- (void)showNext;
- (void)hiddenKeyBoard;
- (void)setViewStatus:(id)textField;
@end
@implementation WSKeyBoardAccessory
kWSStrictSingletonForClass(WSKeyBoardAccessory);
- (id)init
{
    self = [super init];
    if (self) {
        
        _prevButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上一项"
                                                           style:UIBarButtonItemStyleBordered
                                                          target:self
                                                          action:@selector(showPrevious)];
        _nextButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一项"
                                                           style:UIBarButtonItemStyleBordered
                                                          target:self
                                                          action:@selector(showNext)];
        _doneButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成"
                                                           style:UIBarButtonItemStyleBordered
                                                          target:self
                                                          action:@selector(hiddenKeyBoard)];
        //doneButtonItem.tintColor = [UIColor blueColor];
        
        _spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                         target:nil
                                                                         action:nil];
        
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
        toolbar.barStyle = UIBarStyleBlackTranslucent;
        toolbar.items = [NSArray arrayWithObjects:_prevButtonItem, _nextButtonItem, _spaceButtonItem,_doneButtonItem, nil];
        self.inputAccessoryView = toolbar;
        _controlList = nil;
        _currentControl = nil;
    }
    
    return self;
}
//显示上一项
- (void)showPrevious {
    if (_controlList == nil)
    {
        return;
    }
    NSInteger num = -1;
    for (NSInteger i=0; i<[_controlList count]; i++)
    {
        if ([_controlList objectAtIndex:i] == _currentControl)
        {
            num = i;
            break;
        }
    }
    if (num>0)
    {
        [[_controlList objectAtIndex:num] resignFirstResponder];
        [[_controlList objectAtIndex:num-1] becomeFirstResponder];
        [[WSKeyboardManager sharedWSKeyboardManager] setActiveTextField:[_controlList objectAtIndex:num-1]];
        [self setViewStatus:[_controlList objectAtIndex:num-1]];
    }
}
//显示下一项
- (void)showNext {
    if (_controlList==nil)
    {
        return;
    }
    NSInteger num = -1;
    for (NSInteger i=0; i<[_controlList count]; i++)
    {
        if ([_controlList objectAtIndex:i] == _currentControl)
        {
            num = i;
            break;
        }
    }
    if (num < [_controlList count]-1)
    {
        [[_controlList objectAtIndex:num] resignFirstResponder];
        [[_controlList objectAtIndex:num+1] becomeFirstResponder];
        [[WSKeyboardManager sharedWSKeyboardManager] setActiveTextField:[_controlList objectAtIndex:num+1]];
        [self setViewStatus:[_controlList objectAtIndex:num+1]];
    }
}
//显示工具条
- (void)setViewStatus:(id)textField {
    _currentControl = textField;
    
    if (_controlList == nil)
    {
        _prevButtonItem.enabled = NO;
        _nextButtonItem.enabled = NO;
    }
    else
    {
        NSInteger num = -1;
        for (NSInteger i=0; i<[_controlList count]; i++)
        {
            if ([_controlList objectAtIndex:i] == _currentControl)
            {
                num = i;
                break;
            }
        }
        if (num > 0)
        {
            _prevButtonItem.enabled = YES;
        }
        else
        {
            _prevButtonItem.enabled = NO;
        }
        if (num < [_controlList count]-1)
        {
            _nextButtonItem.enabled = YES;
        }
        else
        {
            _nextButtonItem.enabled = NO;
        }
    }
}
//设置输入框数组
- (void)setTextIdlView:(NSArray *)array {
    if (_controlList != nil)
    {
        _controlList = nil;
    }
    if (array.count > 0) {
        [[WSKeyboardManager sharedWSKeyboardManager] setCurrentScrollView:(UIScrollView *)[(UIView *)array[0] ws_superview_withSuperClassType:[UIScrollView class]]];
    }
    else
    {
        return ;
    }
    _controlList = array;
    for (id ctrl in _controlList)
    {
        if ([ctrl isKindOfClass:[UITextField class]])
        {
            ((UITextField *)ctrl).delegate = self;
            ((UITextField *)ctrl).inputAccessoryView = _inputAccessoryView;
        }
        else if ([ctrl isKindOfClass:[UITextView class]])
        {
            ((UITextView *)ctrl).delegate = self;
            ((UITextView *)ctrl).inputAccessoryView = _inputAccessoryView;
        }
    }
}

//隐藏键盘和工具条
- (void)hiddenKeyBoard {
    if (_currentControl != nil)
    {
        [_currentControl resignFirstResponder];
        _currentControl = nil;
    }
    

    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[WSKeyboardManager sharedWSKeyboardManager] setActiveTextField:textField];
    [self setViewStatus:textField];

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    /*
     [textField resignFirstResponder];
     
     if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didClickDoneButton)])
     {
     [self.delegate didClickDoneButton];
     }
     */
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [[WSKeyboardManager sharedWSKeyboardManager] setActiveTextField:textView];
    [self setViewStatus:textView];

    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    /*
     if ([text isEqualToString:@"\n"]) {
     [textView resignFirstResponder];
     return NO;
     }
     */
    return YES;
}
@end
