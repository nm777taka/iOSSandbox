//
// Created by seijiro on 2013/11/02.
// Copyright (c) 2013 lab.seijiro. All rights reserved.
//


#import "NextNavController.h"


@implementation NextNavController {

}

-(id)initWithFolder:(NSDictionary *)folder{

}

-(void)showAlert:(NSString*)title text:(NSString*)text{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:text delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
}

-(id)init{
    self = [super init];
    if(self){
        NSMutableDictionary *folder3_3 = [NSMutableDictionary dictionary];
        NSMutableArray *filed3_3 = [NSMutableArray array];
        [folder3_3 setObject:filed3_3 forKey:@"フォルダ3_3"];
    }
}
@end