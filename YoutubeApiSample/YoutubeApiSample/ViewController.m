//
//  ViewController.m
//  YoutubeApiSample
//
//  Created by seijiro on 2013/11/05.
//  Copyright (c) 2013 seijiro. All rights reserved.
//

#import "ViewController.h"
#import "Parser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Parser *parser = [[Parser alloc]init];
    [Parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end