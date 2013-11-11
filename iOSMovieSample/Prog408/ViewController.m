//
//  ViewController.m
//  Prog408
//
//  Created by 増田 智明 on 12/04/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation AVPlayerView
+ (Class)layerClass
{
    return [AVPlayerLayer class];
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)clickStart:(id)sender
{
    // 動画を表示する
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zoo" ofType:@"mp4"];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    moviePlayer.view.frame = sampleView.frame;
    moviePlayer.view.bounds = sampleView.bounds;
    [self.view addSubview:moviePlayer.view];
    // 繰り返し描画する
    // moviePlayer.repeatMode = MPMovieRepeatModeOne;
    // 動画を開始する
    // フルスクルーンで起動
    moviePlayer.fullscreen = YES;
    // ガイドを消す
    // moviePlayer.controlStyle = MPMovieControlStyleNone;
    //[moviePlayer play];
}

- (IBAction)clickStop:(id)sender
{
    // 動画を停止する
    [moviePlayer stop];
}
- (IBAction)clickPause:(id)sender
{
    // 動画を停止する
    [moviePlayer pause];
}


-(IBAction)clickOpen:(id)sender
{
    AVPlayerView *av = [[AVPlayerView alloc] initWithFrame:sampleView.frame];
    [self.view addSubview:av];
    
    
    // 動画を表示する
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zoo" ofType:@"mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:path]];
    AVPlayerLayer *layer = (AVPlayerLayer*)av.layer;
    layer.player = player;
    [player play];
}
-(IBAction)clickURL:(id)sender
{
    // URLを指定する
    NSString *path = @"http://moonmile.net/up/zoo.mp4";
    moviePlayer = [[MPMoviePlayerController alloc] init];
    moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    moviePlayer.view.frame = sampleView.frame;
    moviePlayer.view.bounds = sampleView.bounds;
    [self.view addSubview:moviePlayer.view];
    // 繰り返し描画する
    // moviePlayer.repeatMode = MPMovieRepeatModeOne;
    // 動画を開始する
    [moviePlayer setContentURL:[NSURL fileURLWithPath:path]];
    [moviePlayer play];
}

-(IBAction)clickFull:(id)sender
{
    // フルスクリーンで表示する
    //moviePlayer.fullscreen = YES;
    [moviePlayer setFullscreen:YES];
}

@end
