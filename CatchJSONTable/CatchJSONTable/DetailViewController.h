//
//  DetailViewController.h
//  CatchJSONTable
//
//  Created by Shaun on 19/09/2017.
//  Copyright © 2017 Shaun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) NSDictionary *data;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)backAction:(id)sender;

@end
