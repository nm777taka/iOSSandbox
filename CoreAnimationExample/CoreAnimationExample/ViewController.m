//
//  ViewController.m
//  CoreAnimationExample
//
//  Created by seijiro ozawa on 6/29/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rotate:(id)sender {
    /* 回転 */
    
    // z軸に対して回転．（z軸を指定するとUIViewのアニメーションのように回転）
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    // アニメーションのオプションを設定
    animation.duration = 2.5; // アニメーション速度
    animation.repeatCount = 1; // 繰り返し回数
    
    // 回転角度を設定
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 開始時の角度
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI]; // 終了時の角度
    
    // アニメーションを追加
    [_imageView.layer addAnimation:animation forKey:@"rotate-layer"];
}
- (IBAction)translate:(id)sender {
    /* 移動 */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // アニメーションのオプションを設定
    animation.duration = 2.5; // アニメーション速度
    animation.repeatCount = 1; // 繰り返し回数
    
    // 始点と終点を設定
    animation.fromValue = [NSValue valueWithCGPoint:_imageView.layer.position]; // 始点
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 480)]; // 終点
    
    // アニメーションを追加
    [_imageView.layer addAnimation:animation forKey:@"move-layer"];
}
- (IBAction)scale:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.5f;
    animation.autoreverses = YES;
    
    animation.fromValue = @1.0;
    animation.toValue = @0.5;
    animation.timingFunction =
    [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    
    [_imageView.layer addAnimation:animation forKey:@"scale-layer"];

}

@end
