//
//  HKMenuView.m
//  SlideMenu3D
//
//  Created by Edgar on 4/6/15.
//  Copyright (c) 2015 @hunk. All rights reserved.
//

#import "HKMenuView.h"
#import "AppDelegate.h"

@interface HKMenuView ()
{
    NSArray *images;
    NSArray *titles;
}

@end

@implementation HKMenuView

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //images = @[@"mail",@"call-ico",@"camera-ico",@"contacts-ico",@"settings-ico"];
    titles = @[@"directory",@"news",@"library",@"events"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView reloadData];
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
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [titles objectAtIndex:indexPath.row];
    
    UIFont *currentFont = cell.textLabel.font;
    UIFont *correctFont = [UIFont fontWithName:currentFont.fontName size:currentFont.pointSize+5];
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
    if (indexPath.row % 2)
    {
        [[AppDelegate mainDelegate] setSecondView];
    }
    else
    {
        [[AppDelegate mainDelegate] setFirstView];
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
