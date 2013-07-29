//
//  LabCanvasView.m
//  SketchApp
//
//  Created by Seijiro on 2013/07/29.
//  Copyright (c) 2013年 seijiro.ozawa. All rights reserved.
//

#import "LabCanvasView.h"

@implementation LabCanvasView : UIView{
    UIImage* _canvas;
}
- (void)drawRect:(CGRect)rect {
    _canvas = [self canvasImage];
    [_canvas drawAtPoint:CGPointMake(0, 0)];
}
-(UIImage*)canvasImage{
    UIGraphicsBeginImageContext(self.bounds.size);
    [[UIColor redColor] setFill];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillEllipseInRect(context, self.bounds);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;

}


@end
