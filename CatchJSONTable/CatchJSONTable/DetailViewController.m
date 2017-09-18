//
//  DetailViewController.m
//  CatchJSONTable
//
//  Created by Shaun on 19/09/2017.
//  Copyright © 2017 Shaun. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [_textView setText:[_data objectForKey:@"content"]];
    [_titleLabel setText:[_data objectForKey:@"title"]];
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
