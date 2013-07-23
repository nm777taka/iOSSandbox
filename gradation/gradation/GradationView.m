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
    LBGradient* gradient = [[LBGradient alloc] initWithColorsAndLocations:[UIColor blueColor], 0.0f, [UIColor redColor], 0.5f, [UIColor greenColor], 1.0f, nil];
    [gradient drawInRect:self.bounds angle:289.0f];
}

@end