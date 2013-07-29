//
//  GradientView.h
//  GradationSample
//
//  Created by shuichi on 13/02/17.
//  Copyright (c) 2013年 Shuichi Tsutsumi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	GradientTypeNone,
	GradientTypeLinear1,    // without LBGradient
	GradientTypeLinear2,    // with LBGradient
    GradientTypeRadial1,
    GradientTypeRadial2,
} GradientType;

@interface GradientView : UIView

@property (nonatomic, assign) GradientType gradientType;

@end
