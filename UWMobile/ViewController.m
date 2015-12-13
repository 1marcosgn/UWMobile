//
//  ViewController.m
//  UWMobile
//
//  Created by Marcos Garcia on 11/29/15.
//  Copyright © 2015 Marcos Garcia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[AppDelegate mainDelegate].slideMenuVC setEnablePan:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showMenu:(id)sender
{
    [[AppDelegate mainDelegate].slideMenuVC toggleMenu];
}

-(void)someActtion
{
    [[AppDelegate mainDelegate].slideMenuVC toggleMenu];
}

@end
