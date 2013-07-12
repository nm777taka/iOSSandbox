//
// Created by Seijiro on 2013/07/04.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIImage+Mask.h"

// カテゴリーという言語仕様らしい
@implementation UIImage (Mask)

-(UIImage *)generateMaskImage:(UIColor *)maskColor{

    // 描画領域のサイズ
    const CGRect rect = CGRectMake(0.0f, 0.0f,self.size.width ,self.size.height );

    //画像サイズでBitmapコンテキストを取得
    const CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    const CGContextRef ctx = CGBitmapContextCreate(NULL, rect.size.width, rect.size.height,
            8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);


    if (ctx == NULL) {
        return nil;
    }

    // 指定色を一面に塗ってそのコンテキストからCGImageRefを生成
    CGContextSetFillColorWithColor(ctx, maskColor.CGColor);
    CGContextFillRect(ctx, rect);
    const CGImageRef colorImageRef = CGBitmapContextCreateImage(ctx);

    // 一旦コンテキストをクリア
    CGContextClearRect(ctx, rect);

    // マスク
    CGContextClipToMask(ctx, rect, self.CGImage);
    CGContextDrawImage(ctx, rect, colorImageRef);

    // ビットマップグラフィックコンテキストからマスク済み画像を生成
    CGImageRef maskedImageRef = CGBitmapContextCreateImage(ctx);
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedImageRef];

    // release
    CGImageRelease(colorImageRef);
    CGImageRelease(maskedImageRef);
    CGContextRelease(ctx);

    return maskedImage;
}




@end