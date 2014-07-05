//
//  MasterViewController.h
//  ScrollDelegateSample
//
//  Created by seijiro ozawa on 7/5/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController<UIScrollViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
