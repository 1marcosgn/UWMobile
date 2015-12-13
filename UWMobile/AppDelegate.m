//
//  AppDelegate.m
//  UWMobile
//
//  Created by Marcos Garcia on 11/29/15.
//  Copyright © 2015 Marcos Garcia. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<HKSlideMenu3DControllerDelegate>
{
    HKMenuView *menuVC;
    RotationNavigationController *navMain;
}
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.slideMenuVC = [[HKSlideMenu3DController alloc] init];
    self.slideMenuVC.view.frame = [[UIScreen mainScreen]bounds];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    menuVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"HKMenuView"];
    menuVC.view.backgroundColor = [UIColor clearColor];
    navMain = (RotationNavigationController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"MainNavController"];
    
    self.slideMenuVC.menuViewController = menuVC;
    self.slideMenuVC.mainViewController = navMain;
    
    //self.slideMenuVC.backgroundImage = [UIImage imageNamed:@"background"];
    self.slideMenuVC.backgroundImageContentMode = UIViewContentModeBottomLeft;
    self.slideMenuVC.enablePan = NO;
    
    self.slideMenuVC.delegate = menuVC.self;
    
    [self.window setRootViewController:self.slideMenuVC];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

+ (AppDelegate *)mainDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)openViewController
{
    UWViewController *uwViewController = [[UWViewController alloc] initWithNibName:@"UWViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:uwViewController];
    self.slideMenuVC.mainViewController = navController;
}

- (void)openTableViewController
{
    UWTableViewController *uwTableViewController = [[UWTableViewController alloc] initWithNibName:@"UWTableViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:uwTableViewController];
    self.slideMenuVC.mainViewController = navController;
}

@end
