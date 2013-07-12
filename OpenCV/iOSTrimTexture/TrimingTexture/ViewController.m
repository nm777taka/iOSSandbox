//
//  ViewController.m
//  TrimingTexture
//
//  Created by Seijiro on 2013/07/08.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"resized.png"];

    CGRect rect = CGRectMake( 50, 50, 220, 380);
    CGImageRef cgImage = CGImageCreateWithImageInRect(img.CGImage, rect);
    img = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);

    imageView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end