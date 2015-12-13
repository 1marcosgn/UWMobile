//
//  AppDelegate.h
//  UWMobile
//
//  Created by Marcos Garcia on 11/29/15.
//  Copyright © 2015 Marcos Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HKSlideMenu3DController.h>
#import "RotationNavigationController.h"
#import "UWViewController.h"
#import "UWTableViewController.h"
#import "HKMenuView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) HKSlideMenu3DController *slideMenuVC;

+ (AppDelegate *)mainDelegate;
- (void)openViewController;
- (void)openTableViewController;

@end

