//
//  AppDelegate.m
//  ExpandingCells
//
//  Created by work on 1/7/13.
//  Copyright (c) 2013 sbyrd. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "ProfileViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    self.firstViewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    
    self.secondViewController = [[[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil] autorelease];
    
    self.navController1 = [[UINavigationController alloc] initWithRootViewController:self.firstViewController];
    self.navController2 = [[UINavigationController alloc] initWithRootViewController:self.secondViewController];
    
    [self.navController1 setNavigationBarHidden:YES];
    [self.navController2 setNavigationBarHidden:YES];
    
    
    //create an array of all view controllers that will represent the tab at the bottom
    NSArray *myViewControllers = [[NSArray alloc] initWithObjects:
                                  self.navController1,
                                  self.navController2, nil];
    
    //initialize the tab bar controller
    self.tabBarController = [[UITabBarController alloc] init];
    
    //set the view controllers for the tab bar controller
    [self.tabBarController setViewControllers:myViewControllers];
    
    //add the tab bar controllers view to the window
    [self.window addSubview:self.tabBarController.view];
    
    
    //set the window background color and make it visible
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
