//
//  HKMenuView.m
//  SlideMenu3D
//
//  Created by Edgar on 4/6/15.
//  Copyright (c) 2015 @hunk. All rights reserved.
//

#import "HKMenuView.h"
#import "AppDelegate.h"

#define kUWMenuElements @"UWMenuElements"
#define kCellIdentifier @"CellIdentifier"
#define kTitle @"title"
#define kAction @"action"
#define kOpenViewController @"openViewController"
#define kOpenTableViewController @"openTableViewController"

@interface HKMenuView ()
{
    NSArray *images;
    NSArray *titles;
}

@end

@implementation HKMenuView

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    titles = [self getElements];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView reloadData];
}

-(NSArray *)getElements
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:kUWMenuElements ofType:@"plist"];
    NSArray *propertyListValues = [NSArray arrayWithContentsOfFile:plistPath];
    return propertyListValues;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = kCellIdentifier;
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[titles objectAtIndex:indexPath.row] valueForKey:kTitle];
    
    UIFont *currentFont = cell.textLabel.font;
    UIFont *correctFont = [UIFont fontWithName:currentFont.fontName size:22];
    cell.textLabel.font = correctFont;
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *actionToPerform = [[titles objectAtIndex:indexPath.row] valueForKey:kAction];
    
    if ([actionToPerform isEqualToString:kOpenViewController])
    {
        [[AppDelegate mainDelegate] openViewController];
    }
    else if ([actionToPerform isEqualToString:kOpenTableViewController])
    {
        [[AppDelegate mainDelegate] openTableViewController];
    }
}

#pragma mark HKSlideMenu3DControllerDelegate methods
-(void)willOpenMenu
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)didOpenMenu
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)willCloseMenu
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

-(void)didCloseMenu
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
