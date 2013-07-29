//
//  ViewController.m
//  GradationSample
//
//  Created by shuichi on 13/02/17.
//  Copyright (c) 2013年 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "GradientView.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet GradientView *gradientView;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -------------------------------------------------------------------
#pragma mark IBAction

- (IBAction)pressBtn:(UIButton *)sender {
    
    switch (sender.tag) {
            
        case 0:
            [self.gradientView setGradientType:GradientTypeLinear1];
            break;

        case 1:
            [self.gradientView setGradientType:GradientTypeRadial1];
            break;

        case 2:
            [self.gradientView setGradientType:GradientTypeRadial2];
            break;

        default:
            [self.gradientView setGradientType:GradientTypeNone];
            break;
    }    

    [self.gradientView setNeedsDisplay];
}

@end
