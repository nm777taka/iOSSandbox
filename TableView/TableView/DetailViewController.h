//
//  DetailViewController.h
//  TableView
//
//  Created by seijiro on 2013/11/03.
//  Copyright (c) 2013年 lab.seijiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
