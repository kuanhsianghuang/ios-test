//
//  MainViewController.h
//  CatchJSONTable
//
//  Created by Shaun on 18/09/2017.
//  Copyright © 2017 Shaun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightDetailTableViewCell.h"
#import "DetailViewController.h"

@interface MainViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *customBGView;
@property (strong, nonatomic) IBOutlet UIView *blackView;

@end
