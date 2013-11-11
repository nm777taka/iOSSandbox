//
// Created by seijiro on 2013/11/02.
// Copyright (c) 2013 lab.seijiro. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface NextNavController : UIViewController < UITableViewDelegate, UITableViewDataSource>{
    UITableView* _tableView;
    NSDictionary *_folder;
}

-(id)initWithFolder:(NSDictionary *)folder;

@end