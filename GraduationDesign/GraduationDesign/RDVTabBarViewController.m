//
//  RDVTabBarViewController.m
//  GraduationDesign
//
//  Created by ziwen.xi on 16/2/16.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "RDVTabBarViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface RDVTabBarViewController ()

@end

@implementation RDVTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    [self setupViewControllers];
    
}


- (void)setupViewControllers {
    
    UIViewController *firstViewController = [[UIViewController alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[UIViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[UIViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController]];

    
    
    
    UIImage *finishedImage = [UIImage imageNamed:@"btn_geren_normal"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"btn_geren_normal"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third"];
    
    RDVTabBar *tabBar = [tabBarController tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 63)];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
    
    
    tabBar.translucent = YES;
    tabBar.backgroundView.backgroundColor = [UIColor colorWithRed:245/255.0
                                                            green:245/255.0
                                                             blue:245/255.0
                                                            alpha:0.9];
    
    
    
    
    
}




@end
