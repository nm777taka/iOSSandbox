//
// Created by seijiro on 2013/11/05.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Parser : NSObject

+(NSArray *)parse;
+(NSString*) read:(NSString*)url;

@end