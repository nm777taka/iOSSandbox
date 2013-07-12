//
//  ViewController.m
//  CVFloodFillTest
//
//  Created by Seijiro on 2013/07/11.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    読み込み
    UIImage *src = [UIImage imageNamed:@"mona.png"];

    UIImage *hsv = [self rgb2hsv:src];

    UIImage *flood = [self floodFill:hsv];

//    View作成、追加
    UIImageView *imageView = [[UIImageView alloc] initWithImage:flood];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UIImage *)floodFill:(UIImage *)src{
    IplImage *img = [self uiimage2iplimage:src];
//    IplImage *mask;
    CvPoint point = cvPoint(200, 10);
    cvFloodFill(img, point, CV_RGB(255,0,0), CV_RGB(8,90,60), CV_RGB(10,100,70),NULL,4,NULL);
    UIImage *uiimge = [self iplImage2uiImage:img];

    return uiimge;
}

- (UIImage *)rgb2hsv:(UIImage *)src{
//    OpenCVで扱えるようにIplImageに変換
    IplImage *pic = [self uiimage2iplimage:src];
//    書き込みバッファ
    IplImage *hsv_buf = cvCloneImage(pic);

//    hsvに変換
    cvCvtColor(pic, hsv_buf, CV_BGR2HSV);

    //UIImageに戻して返す
    return [self iplImage2uiImage:hsv_buf];
}

-(IplImage *)uiimage2iplimage:(UIImage *)src{
    CGImageRef imageRef = src.CGImage;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    IplImage *iplimage = cvCreateImage(cvSize(src.size.width,src.size.height), IPL_DEPTH_8U, 4 );

    CGContextRef contextRef = CGBitmapContextCreate(
            iplimage->imageData,
            iplimage->width,
            iplimage->height,
            iplimage->depth,
            iplimage->widthStep,
            colorSpace,
            kCGImageAlphaPremultipliedLast|kCGBitmapByteOrderDefault);
    CGContextDrawImage(contextRef,
            CGRectMake(0, 0, src.size.width, src.size.height),
            imageRef);

    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpace);

    IplImage *ret = cvCreateImage(cvGetSize(iplimage), IPL_DEPTH_8U, 3);
    cvCvtColor(iplimage, ret, CV_RGBA2BGR);
    cvReleaseImage(&iplimage);

    return ret;
}

-(UIImage *)iplImage2uiImage:(IplImage *)src{
    CGColorSpaceRef colorSpace;
    if (src->nChannels == 1)
    {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
        //BGRになっているのでRGBに変換
        cvCvtColor(src, src, CV_BGR2RGB);
    }
    NSData *data = [NSData dataWithBytes:src->imageData length:src->imageSize];
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    CGImageRef imageRef = CGImageCreate(src->width,
            src->height,
            src->depth,
            src->depth * src->nChannels,
            src->widthStep,
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