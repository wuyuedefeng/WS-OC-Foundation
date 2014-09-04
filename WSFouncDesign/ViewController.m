//
//  ViewController.m
//  WSFouncDesign
//
//  Created by wangsen on 14-7-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "WSTransObj.h"
#import "WSAudioRecordManager.h"
#import "AddressbookListViewController.h"
#import "UIViewController+Category.h"
#import "NGAudioPlayer-Prefix.h"
#import "NGAudioPlayer.h"
#import "UIView+Category.h"
#import "UIApplication+Category.h"
#import "UIView+Category.h"
#import "Teacher.h"

@interface ViewController ()
{
    WSAudioRecordManager *manager;
//    NCMusicEngine *ws;
//    *ws;
    NGAudioPlayer *ws;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    ws = [[NGAudioPlayer alloc] init ];
//    [ws playURL:[NSURL URLWithString:@"http://112.126.64.124//tongxinfile/files/bab25ea781661675361034eebfa83b72.amr"]];
//    [ws ws_documentsPath];
//    
//    [self WS_GCD_back:^{
//        WSLogA(@"%@",@"abc");
//    }];
//    
    Teacher *tea = [[Teacher alloc] init];
    tea.teacherAge = @"20";
    tea.teacherAge = @"18";
    Name *nam = [[Name alloc] init];
    nam.nameCStr = @"namename";
    tea.nameModal = nam;

    NSArray *arr = [NSArray arrayWithObjects:tea, nil];
    NSArray *dicArr = [WSTransObj dictionaryArray_from_modalArray:arr];
    NSLog(@"%@",dicArr);
    NSLog(@"%@",dicArr[0][@"_teacherAge"]);
    

}
//模型模型数组《＝》字典模型数组
- (IBAction)数据模型转换:(UIButton *)sender {
    //[self WSTransObj_test];
    [self.view ws_loadAnimation:^{
        NSLog(@"abc");
    }];
}

- (IBAction)录音View:(UIButton *)sender {
    RecordView *recordView = [[RecordView alloc] initWithFrame:self.view.frame];
    //recordView.delegate = self;
    [self.view addSubview:recordView];
}
- (IBAction)手机通讯录:(UIButton *)sender {
    AddressbookListViewController *addressbook = [[AddressbookListViewController alloc] init];
    [self presentViewController:addressbook animated:YES completion:nil];

}
- (IBAction)imgClick:(id)sender {
    
    UIButton *myView = (UIButton *)sender;
    [myView ws_previewImageUrlStr:@"http://img.anzhuo.im/public/picture/2012122401/1348137920992.jpg" placeholderImage:myView.currentImage CanZoom:YES];
    
}

//                       _ooOoo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      O\  =  /O
//                   ____/`---'\____
//                 .'  \\|     |//  `.
//                /  \\|||  :  |||//  \
//               /  _||||| -:- |||||-  \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |   |
//               \  .-\__  `-`  ___/-. /
//               _`. .'  /--.--\  `. . __
//          ."" '<  `.___\_<|>_/___.'  >'"".
//        | |  :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `-.   \_ __\ /__ _/   .-` /  /
//    ======`-.____`-.___\_____/___.-`____.-'======
//                       `=---='
//   ^^^^^^^^^^^^^^^^^^^^wangsen^^^^^^^^^^^^^^^^^^^^^^

- (IBAction)ttt:(id)sender {

}
#pragma mark - 数据模型转换test
//- (void)WSTransObj_test
//{
//    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"zhangsan",@"name",@"nv",@"sex",@10,@"age" ,nil];
//    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"wangsen",@"name",@"nan",@"sex" ,@11,@"age" ,nil];
//    NSArray *arr = [NSArray arrayWithObjects:dict1,dict2, nil];
//    //WSTransObj *wsTrans = [[WSTransObj alloc] init];
//    //字典转模型
//    NSArray *arr2 = [WSTransObj modalArray_from_dictionaryArr:arr];
//    for (id abc in arr2) {
//        // NSString *ss = [wsTrans nameGetterOfModal:abc withKey:@"age"];
//        Class class = [abc class];
//        
//        NSString *strClass = NSStringFromClass(class);
//        NSLog(@"ws= %@",strClass);
//        NSLog(@"%@----%@--- ",[[WSTransObj valueGetterOfModal:abc withKey:@"name"] class],[WSTransObj valueGetterOfModal:abc withKey:@"sex"]);
//    }
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains [c] 'an'"];
//    NSArray *tmpArr=[arr2 filteredArrayUsingPredicate:predicate];
//
//        
//    for (id abc in tmpArr) {
//        // NSString *ss = [wsTrans nameGetterOfModal:abc withKey:@"age"];
//        NSLog(@"搜索结果 %@----%@ --- ",[[WSTransObj valueGetterOfModal:abc withKey:@"name"] class],[WSTransObj valueGetterOfModal:abc withKey:@"name"]);
//    }
//}

@end
