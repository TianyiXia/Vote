//
//  AppDelegate.h
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"

@class ProfileViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) ViewController *firstViewController;
@property (strong, nonatomic) ProfileViewController *secondViewController;
@property (nonatomic, strong) UINavigationController *navController1;
@property (nonatomic, strong) UINavigationController *navController2;


@end
