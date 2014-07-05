//
//  DragImageView.h
//  Circle
//
//  Created by seijiro ozawa on 7/5/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BallMove.h"

@interface DragImageView : UIImageView
@property(assign, nonatomic) id <BallMove, NSObject> delegate;

@end
