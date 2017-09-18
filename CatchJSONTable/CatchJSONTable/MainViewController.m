//
//  MainViewController.m
//  CatchJSONTable
//
//  Created by Shaun on 18/09/2017.
//  Copyright © 2017 Shaun. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

NSArray *jsonData = nil;

- (void)viewDidLoad {
    [self setNeedsStatusBarAppearanceUpdate];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)refreshControl:(id)sender {
    NSError *error;
    NSURL *url = [NSURL URLWithString:@"https://raw.githubusercontent.com/catchnz/ios-test/master/data/data.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    _customBGView.backgroundColor = [UIColor lightGrayColor];
    _customBGView.alpha = 0.5;
    self.tableView.backgroundView = _customBGView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    self.tableView.separatorColor = [UIColor darkGrayColor];
    [self.tableView reloadData];
    
    
    [sender endRefreshing];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"titleSubtitleIdentifier";
	RightDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDictionary *data = [jsonData objectAtIndex:indexPath.row];
    
    [cell.titleLabel setText:[data objectForKey:@"title"]];
    [cell.detailLabel setText:[data objectForKey:@"subtitle"]];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [jsonData count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(!jsonData)
    {
    	_customBGView.backgroundColor = [UIColor blackColor];
    	return _customBGView;
    }
    else
        return _blackView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (!jsonData) ? self.tableView.frame.size.height : [UIApplication sharedApplication].statusBarFrame.size.height;
}
/*
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(!jsonData)
    {
        return nil;
    }
    else
        return _blackView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return (!jsonData) ? 0 : [UIApplication sharedApplication].statusBarFrame.size.height;
    
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailViewController  = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailViewController.data = [jsonData objectAtIndex:indexPath.row];
    
    [self presentViewController:detailViewController animated:YES completion:nil];
}

@end
