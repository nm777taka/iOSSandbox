//
// Created by Seijiro on 2013/07/04.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//
#import "UIImage+MergeMask.h"

@implementation UIImage (mergeMask)

-(UIImage *)mergeMask:(UIImage *)mask{

    CGRect rect = CGRectZero;
    rect.size = self.size;

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);


    UIImage *localMask = [mask rotateVertical];
    CGContextClipToMask(UIGraphicsGetCurrentContext(), rect, localMask.CGImage);

    [self drawAtPoint:CGPointZero];

    UIImage *maskedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return maskedImage;
}
-(UIImage *)rotateVertical{
    CGRect rect = CGRectZero;
    rect.size = self.size;

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawImage(context, rect, self.CGImage);

    CGContextRestoreGState(context);
    UIImage *screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenImage;

}

@end