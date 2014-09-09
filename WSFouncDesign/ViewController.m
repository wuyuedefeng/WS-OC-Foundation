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
#import "UIViewController+WSCategory.h"
#import "NGAudioPlayer-Prefix.h"
#import "NGAudioPlayer.h"
#import "UIView+WSCategory.h"
#import "UIApplication+WSCategory.h"
#import "UIView+WSCategory.h"
#import "Teacher.h"
#import "WSKeyboardManager.h"
#import "NSObject+WSCategory.h"
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
    
    
    

}
//模型模型数组《＝》字典模型数组
- (IBAction)数据模型转换:(UIButton *)sender {
    //[self WSTransObj_test];
    Teacher *tea = [[Teacher alloc] init];
    tea.teacherAge = @"20";
    tea.teacherAge = @"18";
    Name *nam = [[Name alloc] init];
    nam.nameCStr = @"namename";
    tea.nameModal = nam;
    
    Teacher *tea2 = [[Teacher alloc] init];
    tea2.teacherAge = @"20";
    tea2.teacherAge = @"18";
    Name *nam2 = [[Name alloc] init];
    nam2.nameCStr = @"namename";
    tea2.nameModal = nam;
    
    NSArray *arr = [NSArray arrayWithObjects:tea,tea2, nil];
    NSArray *dicArr = [WSTransObj dictionaryArray_from_modalArray:arr];
    NSLog(@"%@",dicArr);
    NSLog(@"%@",dicArr[0][@"teacherAge"]);
    
    arr = [WSTransObj modalArray_from_dictionaryArr:dicArr token:@"wangsen"];
//    id ins = [arr[0] transObj_valueForKey:@"nameModal"];
//    NSLog(@"%@",[ins transObj_valueForKey:@"nameCStr"]);
    dicArr = [WSTransObj dictionaryArray_from_modalArray:arr];
    NSLog(@"===%@",dicArr);
    
//    NSLog(@"=============");
//    NSDictionary *dic = dicArr[0];
    
    
    id modal2 = [WSTransObj modalFromToken:@"wangsen"];
    [modal2 transObj_setValue:@"111" forKey:@"teacherAge"];
    
    id modal3 = [modal2 transObj_valueForKey:@"nameModal"];
    [modal3 transObj_setValue:@"abc" forKey:@"nameCStr"];
//
//    
    WSLogA(@"%@:%@",[modal2 transObj_valueForKey:@"teacherAge"],[modal3 transObj_valueForKey:@"nameCStr"]);
//    [modal transObj_setValue:@"20" forKey:@"teacherAge"];
//    NSLog(@"%@",[WSTransObj valueGetterOfModal:[WSTransObj valueGetterOfModal:modal2 withKey:@"nameModal"] withKey:@"nameCStr"]);
//    NSLog(@"-------------");
//    dic = [WSTransObj dictionary_from_modal:modal];
//    NSLog(@"%@",dic);
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
