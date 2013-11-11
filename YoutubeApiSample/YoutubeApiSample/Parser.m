//
// Created by seijiro on 2013/11/05.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//


#import "Parser.h"


@implementation Parser {

}
+(NSArray *)parse{
    NSString *json = [self read:@"sample.json"];
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSDictionary* obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"%@", obj);

    NSMutableArray *result;

    for(NSDictionary *dict in [obj objectForKey:@"feed"]){

    }
    [result addObject:@"hoge"];
    return result;
}

+(NSString*) read:(NSString*)url{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:[[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:url]];
    if(!handle){
        NSLog(@"ファイルがありません。");
        return @"";
    }
    NSData *data = [handle readDataToEndOfFile];


    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

}

@end