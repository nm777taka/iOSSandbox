//
//  CoreImageHelper.m
//  TrimingTexture
//
//  Created by Seijiro on 2013/07/08.
//  Copyright (c) 2013年 Seijiro. All rights reserved.
//

#import "CoreImageHelper.h"

@implementation CoreImageHelper


+ (void)resizeAspectFitImageWithImage:(UIImage*)img atSize:(CGFloat)size completion:(void(^)(UIImage*))completion
{
    CIImage *ciImage = [[CIImage alloc] initWithImage:img];
    // リサイズする倍率を求める
    CGFloat scale = img.size.width < img.size.height ? size/img.size.height : size/img.size.width;
    // CGAffineTransformでサイズ変更
    CIImage *filteredImage = [ciImage imageByApplyingTransform:CGAffineTransformMakeScale(scale,scale)];
    // UIImageに変換
    UIImage *newImg = [self uiImageFromCIImage:ciImage];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        completion(newImg);
    });
}

+ (void)centerCroppingImageWithImage:(UIImage*)img atSize:(CGSize)size completion:(void(^)(UIImage*))completion
{
    CIImage *ciImage = [[CIImage alloc] initWithImage:img];
    /* 画像のサイズ */
    CGSize imgSize = CGSizeMake(img.size.width * img.scale,
                                img.size.height * img.scale);
    /* トリミングするサイズ */
    CGSize croppingSize = CGSizeMake(size.width * [UIScreen mainScreen].scale,
                                     size.height * [UIScreen mainScreen].scale);
    /* 中央でトリミング */
    CIImage *filteredImage = [ciImage imageByCroppingToRect:CGRectMake(imgSize.width/2.f - croppingSize.width/2.f,
                                                                       imgSize.height/2.f - croppingSize.height/2.f,
                                                                       croppingSize.width,
                                                                       croppingSize.height)];
    /* UIImageに変換する */
    UIImage *newImg = [self uiImageFromCIImage:ciImage];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        completion(newImg);
    });
}

+ (UIImage*)uiImageFromCIImage:(CIImage*)ciImage
{
    CIContext *ciContext = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @NO }];
    CGImageRef imgRef = [ciContext createCGImage:ciImage fromRect:[ciImage extent]];
    UIImage *newImg  = [UIImage imageWithCGImage:imgRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    CGImageRelease(imgRef);
    return newImg;
    
    /* iOS6.0以降だと以下が使用可能 */
    //  [[UIImage alloc] initWithCIImage:ciImage scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
}

@end
