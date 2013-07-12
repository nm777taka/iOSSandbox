//
//  ViewController.m
//  CVRemoveBackgroundTest
//
//  Created by Seijiro on 2013/07/08.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"
#import <opencv2/opencv.hpp>

@interface ViewController (){
    UIImageView *imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    //
    UIImage *image = [UIImage imageNamed:@"resized.png"];
    //CVMatに変換
    UIImage *greyImage = [self edge:image];
    imageView = [[UIImageView alloc] initWithImage:greyImage];
    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (cv::Mat)cvMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;

    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels

    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
            cols,                       // Width of bitmap
            rows,                       // Height of bitmap
            8,                          // Bits per component
            cvMat.step[0],              // Bytes per row
            colorSpace,                 // Colorspace
            kCGImageAlphaNoneSkipLast |
                    kCGBitmapByteOrderDefault); // Bitmap info flags

    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpace);

    return cvMat;
}
-(UIImage *)UIImageFromCVMat:(cv::Mat)cvMat
{
    NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize()*cvMat.total()];
    CGColorSpaceRef colorSpace;

    if (cvMat.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }

    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);

    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(cvMat.cols,                                 //width
            cvMat.rows,                                 //height
            8,                                          //bits per component
            8 * cvMat.elemSize(),                       //bits per pixel
            cvMat.step[0],                            //bytesPerRow
            colorSpace,                                 //colorspace
            kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
            provider,                                   //CGDataProviderRef
            NULL,                                       //decode
            false,                                      //should interpolate
            kCGRenderingIntentDefault                   //intent
    );


    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);

    return finalImage;
}

- (UIImage*)doDidPress:(UIImage *)image {

    // 写真をモノクロにする
    cv::Mat srcMat = [self cvMatFromUIImage:image];
    cv::Mat greyMat;
    cv::cvtColor(srcMat, greyMat, CV_BGR2GRAY);
    UIImage *greyImage = [self UIImageFromCVMat:greyMat];

    return greyImage;
}
-(UIImage *)edge:(UIImage *)image{
    cv::Mat src = [self cvMatFromUIImage:image];
    cv::Mat hsv;

    cv::cvtColor(src, hsv, CV_BGR2HSV);

    UIImage *hsvImage = [self UIImageFromCVMat:hsv];

    return hsvImage;
}
@end