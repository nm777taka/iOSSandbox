//
//  ViewController.m
//  MaskGenerater
//
//  Created by Seijiro on 2013/07/04.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"
#import "UIImageMask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"mask1"];

    // マスク画像を生成
    UIImage *maskedImage = [image generateMaskImage:[UIColor blackColor]];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:maskedImage];

    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end