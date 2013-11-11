//
//  ViewController.h
//  Prog408
//
//  Created by 増田 智明 on 12/04/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    IBOutlet UIView *sampleView;
    MPMoviePlayerController *moviePlayer;
}
- (IBAction)clickStart:(id)sender;
- (IBAction)clickStop:(id)sender;
- (IBAction)clickPause:(id)sender;

-(IBAction)clickOpen:(id)sender;
-(IBAction)clickURL:(id)sender;
-(IBAction)clickFull:(id)sender;
@end

@interface AVPlayerView : UIView
@end
