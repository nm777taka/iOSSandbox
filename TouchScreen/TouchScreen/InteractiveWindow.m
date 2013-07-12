//
// Created by Seijiro on 2013/07/03.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "InteractiveWindow.h"


@implementation InteractiveWindow

- (void)drawRect:(CGRect)rect {
//描画先の情報を得る
    CGContextRef context = UIGraphicsGetCurrentContext();
//円のレンダリング
    CGContextFillEllipseInRect(context, CGRectMake(100, 100, 10, 10));
}


@end