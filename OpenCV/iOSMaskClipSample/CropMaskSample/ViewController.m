//
//  ViewController.m
//  CropMaskSample
//
//  Created by Seijiro on 2013/07/04.
//  Copyright (c) 2013 Seijiro. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Mask.h"
#import "UIImage+MergeMask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // マスク画像を生成するpng画像
    const UIImage *maskImage = [UIImage imageNamed:@"mask_basic"];


    const UIImage *mask =
            [self mirrorImage:
            [self rotateImage:
                    maskImage
                        angle:180]];


    //ビットマップ画像を作成
    UIImage *image = [UIImage imageNamed:@"resized"];

    UIImage *clipped = [image mergeMask:mask];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:clipped];

    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (UIImage *)getMaskedImage:(NSString *)filename{
    UIImage *image = [UIImage imageNamed:filename];
    return [image generateMaskImage:[UIColor blackColor]];
}


- (UIImage *) rotateImage:(UIImage *)img angle:(int)angle
{
    CGImageRef imgRef = [img CGImage];
    CGContextRef context;

    switch (angle) {
        case 90:
            UIGraphicsBeginImageContext(CGSizeMake(img.size.height, img.size.width));
            context = UIGraphicsGetCurrentContext();
            CGContextTranslateCTM(context, img.size.height, img.size.width);
            CGContextScaleCTM(context, 1.0, -1.0);
            CGContextRotateCTM(context, (CGFloat) (M_PI/2.0));
            break;
        case 180:
            UIGraphicsBeginImageContext(CGSizeMake(img.size.width, img.size.height));
            context = UIGraphicsGetCurrentContext();
            CGContextTranslateCTM(context, img.size.width, 0);
            CGContextScaleCTM(context, 1.0, -1.0);
            CGContextRotateCTM(context, (CGFloat) -M_PI);
            break;
        case 270:
            UIGraphicsBeginImageContext(CGSizeMake(img.size.height, img.size.width));
            context = UIGraphicsGetCurrentContext();
            CGContextScaleCTM(context, 1.0, -1.0);
            CGContextRotateCTM(context, (CGFloat) (-M_PI/2.0));
            break;
        default:
            NSLog(@"you can select an angle of 90, 180, 270");
            return nil;
    }

    CGContextDrawImage(context, CGRectMake(0, 0, img.size.width, img.size.height), imgRef);
    UIImage *ret = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    return ret;
}

- (UIImage *)mirrorImage:(UIImage *)img{

    CGImageRef imgRef = [img CGImage]; // 画像データ取得

    UIGraphicsBeginImageContext(img.size); // 開始

    CGContextRef context = UIGraphicsGetCurrentContext();
    // コンテキスト取得
    CGContextTranslateCTM( context, img.size.width,
            img.size.height); // コンテキストの原点変更
    CGContextScaleCTM( context, -1.0, -1.0);
    // コンテキストの軸をXもYも等倍で反転
    CGContextDrawImage( context, CGRectMake( 0, 0,
            img.size.width, img.size.height), imgRef);
    // コンテキストにイメージを描画
    UIImage *retImg = UIGraphicsGetImageFromCurrentImageContext();
    // コンテキストからイメージを取得

    UIGraphicsEndImageContext(); // 終了

    return retImg;
}





@end