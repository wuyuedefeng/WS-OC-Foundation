//
//  POPDViewController.h
//  popdowntable
//
//  Created by Alex Di Mango on 15/09/2013.
//  Copyright (c) 2013 Alex Di Mango. All rights reserved.
//
///https://github.com/adimango/POPDownMenuTable
////tableview点击某个cell拓展出cell的子cell 实现cell的伸展。
/*
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *sucSectionsA = [NSArray arrayWithObjects:@"Live",@"My Subscriptions", nil];
    NSArray *sucSectionsB = [NSArray arrayWithObjects:@"Populare",@"Trailer",@"Review", nil];
    NSArray *sucSectionsC = [NSArray arrayWithObjects:@"Cover Stories",@"Popular Science",@"The Future Now", nil];
    
    NSDictionary *sectionA = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"News & Politics", kheader,
                              sucSectionsA, ksubSection,
                              nil];
    
    NSDictionary *sectionB = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Film & Animation", kheader,
                              sucSectionsB, ksubSection,
                              nil];
    
    NSDictionary *sectionC = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"Science & Technology", kheader,
                              sucSectionsC, ksubSection,
                              nil];
    
    NSArray *menu = [NSArray arrayWithObjects:sectionA,sectionB,sectionC, nil];
    POPDViewController *popMenu = [[POPDViewController alloc]initWithMenuSections:menu];
    popMenu.delegate = self;
    popMenu.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //ios7 status bar
    popMenu.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    [self addChildViewController:popMenu];
    [self.view addSubview:popMenu.view];
    
}

#pragma mark POPDViewController delegate

-(void) didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"didSelectRowAtIndexPath: %d,%d",indexPath.section,indexPath.row);
    
}
*/
#import <UIKit/UIKit.h>
#ifndef MB_STRONG
#if __has_feature(objc_arc)
#define MB_STRONG strong
#else
#define MB_STRONG retain
#endif
#endif

#ifndef MB_WEAK
#if __has_feature(objc_arc_weak)
#define MB_WEAK weak
#elif __has_feature(objc_arc)
#define MB_WEAK unsafe_unretained
#else
#define MB_WEAK assign
#endif
#endif

@protocol POPDDelegate <NSObject>

-(void) didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface POPDViewController : UITableViewController
- (id)initWithMenuSections:(NSArray *) menuSections;
@property (MB_WEAK) id<POPDDelegate> delegate;

@end
