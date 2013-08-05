//
//  CanvasView.m
//  RemoveBackground
//
//  Created by Seijiro on 2013/08/01.
//  Copyright (c) 2013年 Seijiro. All rights reserved.
//

#import "CanvasView.h"

@implementation CanvasView{
    UIImage* _canvas;
    CGPoint _touchPoint;
}

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"canvasView_initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"canvasView_draw_rect");
    
    //    _canvas = [self canvasImage];
    [_canvas drawAtPoint:CGPointMake(0, 0)];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"canvasView_touch_began");
    UITouch *touch = [touches anyObject];
    _touchPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"canvasView_touchesMoved");
    UITouch *touch = [touches anyObject];
    CGPoint newPoint = [touch locationInView:self];
    [self canvasImage:newPoint];
    [self setNeedsDisplay];
    
    //    最後のポイントを更新
    _touchPoint = newPoint;
}

-(void)canvasImage:(CGPoint)newPoint{
    NSLog(@"canvasImage");
    UIGraphicsBeginImageContext(self.bounds.size);
    
    UIRectFill(self.bounds);
    [_canvas drawAtPoint:CGPointZero];
    [[UIColor redColor]set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Context の太さを設定
    CGContextSetLineWidth(context,5.0f);
    CGContextSetShouldAntialias(context,true);
    
    CGContextMoveToPoint(context, _touchPoint.x, _touchPoint.y);
    CGContextAddLineToPoint(context, newPoint.x, newPoint.y);
    
    CGContextStrokePath(context);
    
    _canvas = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
