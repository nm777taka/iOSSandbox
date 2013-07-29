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
    CGPoint _touchPoint;
}
- (void)drawRect:(CGRect)rect {
//    _canvas = [self canvasImage];
    [_canvas drawAtPoint:CGPointMake(0, 0)];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _touchPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint newPoint = [touch locationInView:self];
    [self canvasImage:newPoint];
    [self setNeedsDisplay];

//    最後のポイントを更新
    _touchPoint = newPoint;
}

-(void)canvasImage:(CGPoint)newPoint{
    UIGraphicsBeginImageContext(self.bounds.size);

    UIRectFill(self.bounds);
    [_canvas drawAtPoint:CGPointZero];
    [[UIColor redColor]set];
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextMoveToPoint(context, _touchPoint.x, _touchPoint.y);
    CGContextAddLineToPoint(context, newPoint.x, newPoint.y);
    CGContextStrokePath(context);

    _canvas = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}


@end
