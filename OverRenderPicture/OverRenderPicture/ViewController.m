//
//  ViewController.m
//  OverRenderPicture
//
//  Created by Seijiro on 2013/07/18.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *backImageFilename = @"mona.png";
    NSString *fromtImageFileName = @"mask.png";


    UIImage *backImage = [UIImage imageNamed:backImageFilename];
    UIImageView *backView = [[UIImageView alloc] initWithImage:backImage];

    UIImage *fromtImage = [UIImage imageNamed:fromtImageFileName];
    UIImageView *frontView = [[UIImageView alloc] initWithImage:fromtImage];

    [self.view addSubview:backView];
    [self.view addSubview:frontView];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end