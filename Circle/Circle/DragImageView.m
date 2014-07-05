//
//  DragImageView.m
//  Circle
//
//  Created by seijiro ozawa on 7/5/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import "DragImageView.h"

@implementation DragImageView{
    CGPoint startPoint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	startPoint = [[touches anyObject] locationInView:self];
	[[self superview] bringSubviewToFront:self];
    [self.delegate start];
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
	CGPoint pt = [[touches anyObject] locationInView:self];
	CGRect frame = [self frame];
	frame.origin.x += pt.x - startPoint.x;
	frame.origin.y += pt.y - startPoint.y;
	[self setFrame:frame];
    [self.delegate moving];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.delegate stop];
}

@end
