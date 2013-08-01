//
//  ViewController.m
//  ValueTEst
//
//  Created by Seijiro on 2013/07/31.
//  Copyright (c) 2013年 seijiro.ozawa. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action:(UIStoryboardSegue *)segue{
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NextViewController *dvc = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"goSegue"]) {
        dvc.value = @"40";
    }
}

@end
