//
//  FadeImageView.m
//  ScrollDelegateSample
//
//  Created by seijiro ozawa on 7/12/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import "FadeImageView.h"

@implementation FadeImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)fadeAnim{
    self.alpha = 0;
    //アニメーションのタイプを指定
    [UIView beginAnimations:@"fadeIn" context:nil];
    //イージング指定
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //アニメーション秒数を指定
    [UIView setAnimationDuration:0.3];
    //目標のアルファ値を指定
    self.alpha = 1;
    //アニメーション実行
    [UIView commitAnimations];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
