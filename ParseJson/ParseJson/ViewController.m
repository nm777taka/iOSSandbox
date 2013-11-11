//
//  ViewController.m
//  ParseJson
//
//  Created by seijiro on 2013/10/31.
//  Copyright (c) 2013年 seijiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    NSString *json = @"[{\"title\":\"hoge\", \"content\":\"age\"}, {\"title\":\"moge\", \"content\":\"choge\"}]";
    //渡せないのでRawDataに変換
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSArray* obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"%@", obj);
    
    //Jsonの辞書をループ
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for(NSDictionary *dict in obj){
        NSLog(@"title : %@", [dict objectForKey:@"title"]);
        NSLog(@"content : %@", [dict objectForKey:@"content"]);
        
    }
    
}

@end
