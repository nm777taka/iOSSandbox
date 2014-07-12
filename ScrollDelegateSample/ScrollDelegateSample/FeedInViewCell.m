//
//  FeedInViewCellTableViewCell.m
//  ScrollDelegateSample
//
//  Created by seijiro ozawa on 7/12/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import "FeedInViewCell.h"

@implementation FeedInViewCell{
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void) feedIn{
    self.params.alpha = 0;			// 透明から始める
    [UIView animateWithDuration:1.5 delay:2 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.params.alpha = 1;}
                     completion:nil];
}
@end
