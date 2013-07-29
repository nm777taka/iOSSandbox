#import "GradientView.h"
#import "LBGradient.h"

@implementation GradientView
- (void)drawRect:(CGRect)rect
{
    switch (self.gradientType) {

        case GradientTypeNone:
        default:
            break;

        case GradientTypeLinear1:
//            [self drawGradientWithoutLBGradient];
            [self drawGradient];
            break;

        case GradientTypeLinear2:
            [self drawGradient];
            break;

        case GradientTypeRadial1:
            [self drawRadialGradient1];
            break;

        case GradientTypeRadial2:
            [self drawRadialGradient2];
            break;
    }
}


#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (void)drawGradientWithoutLBGradient {

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    CGContextAddRect(context, self.frame);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();

    // グラデーションの色の配列を作成
    UIColor *color1 = [UIColor colorWithRed:1.0 green:0.5 blue:0.4 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.8 green:0.8 blue:0.3 alpha:1.0];
//    UIColor *color1 = [UIColor colorWithWhite:0.2 alpha:1.0];
//    UIColor *color2 = [UIColor colorWithWhite:0.7 alpha:1.0];
    CFMutableArrayRef colors = CFArrayCreateMutable(kCFAllocatorDefault,
                                                    2,
                                                    &kCFTypeArrayCallBacks);
    CFArrayAppendValue(colors, color1.CGColor);
    CFArrayAppendValue(colors, color2.CGColor);


    // グラデーションの位置を0.0〜1.0で指定
    CGFloat locations[] = {0.0f, 1.0f};

    // グラデーションの起点と終点の座標を指定
    CGRect frame = self.bounds;
    CGPoint startPoint = frame.origin;
    CGPoint endPoint = CGPointMake(frame.origin.x + frame.size.width,
                                   frame.origin.y);
    
    // CGGradationRefを生成
    CGGradientRef gradientRef;
    gradientRef = CGGradientCreateWithColors(colorSpaceRef,
                                             colors,
                                             locations);
    
    // グラデーションを描画
    CGContextDrawLinearGradient(context,
                                gradientRef,
                                startPoint,
                                endPoint,
                                kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradientRef);
    CGColorSpaceRelease(colorSpaceRef);
    
    CGContextRestoreGState(context);
}

- (void)drawGradient {

    // 色と位置を指定してLBGradient生成
    UIColor *color1 = [UIColor colorWithRed:3.0 green:0.5 blue:1.0 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.8 green:0.8 blue:0.2 alpha:1.0];

    LBGradient *gradient = [[LBGradient alloc] initWithColorsAndLocations:
                            color1, 0.0f,
                            color2, 1.0f,
                            nil];
    
    [gradient drawInRect:self.bounds angle:0];
}

- (void)drawRadialGradient1 {
    
    UIColor *color1 = [UIColor colorWithRed:1.0 green:0.5 blue:0.4 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.8 green:0.8 blue:0.3 alpha:1.0];
//    UIColor *color1 = [UIColor colorWithWhite:0.2 alpha:1.0];
//    UIColor *color2 = [UIColor colorWithWhite:0.7 alpha:1.0];

    LBGradient *gradient = [[LBGradient alloc] initWithColorsAndLocations:
                            color1, 0.0f,
                            color2, 1.0f,
                            nil];
    
    // グラデーションの中心と半径を決定
    CGFloat halfWidth = self.bounds.size.width  / 2;
    CGFloat halfHeight = self.bounds.size.height / 2;
    CGPoint viewCenter = CGPointMake(halfWidth, halfHeight);
    CGFloat radius = sqrtf(powf(halfWidth, 2) + powf(halfHeight, 2));

    // 放射状にグラデーション描画
    [gradient drawFromCenter:viewCenter
                      radius:0.1
                    toCenter:viewCenter
                      radius:radius
                     options:LBGradientDrawsAfterEndingLocation];
}

- (void)drawRadialGradient2 {
    
    UIColor *color1 = [UIColor colorWithRed:1.0 green:0.5 blue:0.4 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.8 green:0.8 blue:0.3 alpha:1.0];
//    UIColor *color1 = [UIColor colorWithWhite:0.2 alpha:1.0];
//    UIColor *color2 = [UIColor colorWithWhite:0.7 alpha:1.0];

    LBGradient *gradient = [[LBGradient alloc] initWithColorsAndLocations:
                            color1, 0.0f,
                            color2, 1.0f,
                            nil];
    
    // グラデーションの中心と半径を決定
    CGFloat halfWidth = self.bounds.size.width  / 2;
    CGFloat halfHeight = self.bounds.size.height / 2;
    CGPoint fromCenter = CGPointMake(halfWidth  * 0.2,
                                     halfHeight * 0.2);
    CGPoint toCenter = CGPointMake(halfWidth  * 1.5,
                                   halfHeight * 1.5);

    CGFloat radius = sqrtf(powf(halfWidth, 2) + powf(halfHeight, 2));
    
    // 放射状にグラデーション描画
    [gradient drawFromCenter:fromCenter
                      radius:radius * 0.1
                    toCenter:toCenter
                      radius:radius * 0.5
                     options:LBGradientDrawsAfterEndingLocation];
}

@end
