//
//  ViewController.m
//  Circle
//
//  Created by seijiro ozawa on 7/5/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import "ViewController.h"
#import "DragImageView.h"

@interface ViewController (){
    
    __weak IBOutlet DragImageView *ball;
    __weak IBOutlet UIImageView *goalImage;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ball.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)start{
    NSLog(@"Start");
}
- (void)moving{
    NSLog(@"Moving");
    NSLog(@"x=%f:y=%f", ball.frame.origin.x, ball.frame.origin.y);
    NSLog(@"width=%f;height=%f", ball.frame.size.width, ball.frame.size.height);

    //衝突検出
    if(
            // X軸
            goalImage.frame.origin.x < ball.frame.origin.x &&
            goalImage.frame.origin.x + goalImage.frame.size.width > ball.frame.origin.x &&
            // Y軸
            goalImage.frame.origin.y < ball.frame.origin.y &&
            goalImage.frame.origin.y + goalImage.frame.size.height > ball.frame.origin.y
            ){
        NSLog(@"HIT!!!!");
    }
}
- (void)stop{
    NSLog(@"Stop");

    //衝突検出
    if(
            // X軸
            goalImage.frame.origin.x < ball.frame.origin.x &&
            goalImage.frame.origin.x + goalImage.frame.size.width > ball.frame.origin.x &&
            // Y軸
            goalImage.frame.origin.y < ball.frame.origin.y &&
            goalImage.frame.origin.y + goalImage.frame.size.height > ball.frame.origin.y
            ){
        NSLog(@"出品完了！！");
    }
}


@end