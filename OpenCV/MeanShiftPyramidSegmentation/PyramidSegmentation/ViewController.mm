//
//  ViewController.m
//  PyramidSegmentation
//
//  Created by Seijiro on 2013/07/09.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"

#import <opencv2/opencv.hpp>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *src = [UIImage imageNamed:@"mona"];

    IplImage *cvsrc = [self IplImageFromUIImage:src];

    CvMemStorage *storage = 0;
    CvSeq *comp = 0;
    storage = cvCreateMemStorage (0);
    IplImage *cvdst = cvCloneImage (cvsrc);

    cvPyrMeanShiftFiltering(cvsrc, cvdst,30,30, 2, cvTermCriteria (CV_TERMCRIT_ITER + CV_TERMCRIT_EPS, 5, 1));
    cvReleaseMemStorage (&storage);

    UIImage *img = [self UIImageFromIplImage:cvdst];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IplImage*)IplImageFromUIImage:(UIImage*)image
{
    CGImageRef imageRef = image.CGImage;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    IplImage *iplimage = cvCreateImage(cvSize(image.size.width,image.size.height), IPL_DEPTH_8U, 4 );

    CGContextRef contextRef = CGBitmapContextCreate(
            iplimage->imageData,
            iplimage->width,
            iplimage->height,
            iplimage->depth,
            iplimage->widthStep,
            colorSpace,
            kCGImageAlphaPremultipliedLast|kCGBitmapByteOrderDefault);
    CGContextDrawImage(contextRef,
            CGRectMake(0, 0, image.size.width, image.size.height),
            imageRef);

    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpace);

    IplImage *ret = cvCreateImage(cvGetSize(iplimage), IPL_DEPTH_8U, 3);
    cvCvtColor(iplimage, ret, CV_RGBA2BGR);
    cvReleaseImage(&iplimage);

    return ret;
}
- (UIImage*)UIImageFromIplImage:(IplImage*)image
{
    CGColorSpaceRef colorSpace;
    if (image->nChannels == 1)
    {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
        //BGRになっているのでRGBに変換
        cvCvtColor(image, image, CV_BGR2RGB);
    }
    NSData *data = [NSData dataWithBytes:image->imageData length:image->imageSize];
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    CGImageRef imageRef = CGImageCreate(image->width,
            image->height,
            image->depth,
            image->depth * image->nChannels,
            image->widthStep,
            colorSpace,
            kCGImageAlphaNone|kCGBitmapByteOrderDefault,
            provider,
            NULL,
            false,
            kCGRenderingIntentDefault
    );
    UIImage *ret = [UIImage imageWithCGImage:imageRef];

    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);

    return ret;
}
@end