//
//  ViewController.m
//  gradation
//
//  Created by Seijiro on 2013/07/18.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"
#import "GradationView.h"
#import "LBGradient.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    GradationView *view = [[GradationView alloc] init];
    [self.view addSubview:view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end