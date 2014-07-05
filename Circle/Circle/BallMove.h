//
//  BallMove.h
//  Circle
//
//  Created by seijiro ozawa on 7/5/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BallMove <NSObject>

@required
- (void)start;

@required
- (void)moving;

@required
- (void)stop;

@end
