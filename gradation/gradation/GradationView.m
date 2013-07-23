//
// Created by Seijiro on 2013/07/18.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "GradationView.h"
#import "LBGradient.h"


@implementation GradationView {

}
-(void)drawRect:(CGRect)rect {
    LBGradient* gradient = [[LBGradient alloc] initWithColorsAndLocations:
            [UIColor blueColor], 0.0f,
                    [UIColor cyanColor], 0.9f, nil];
//    引数：angleは横から見た角度
    [gradient drawInRect:self.bounds angle:90.0f];
}

@end