//
//  ViewController.m
//  buttonLarge
//
//  Created by seijiro ozawa on 6/29/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.5f;
    animation.autoreverses = YES;
    
    animation.fromValue = @1.0;
    animation.toValue = @1.5;
    animation.timingFunction =
            [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];

    [_button.layer addAnimation:animation forKey:@"scale-layer"];

}
- (void)animationDidStart:(CAAnimation *)theAnimation
{
    NSLog(@"開始");
}

/**
* アニメーション終了時
*/
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    NSLog(@"終了");
}
@end