//
//  FeedInViewCellTableViewCell.h
//  ScrollDelegateSample
//
//  Created by seijiro ozawa on 7/12/14.
//  Copyright (c) 2014 seijiro ozawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedInViewCell : UITableViewCell{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *params;

- (void) feedIn;
@end
