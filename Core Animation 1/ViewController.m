//
//  ViewController.m
//  Core Animation 1
//
//  Created by Mitchell Porter on 5/25/15.
//  Copyright (c) 2015 Mitchell Porter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Background
    self.view.backgroundColor = [UIColor grayColor];
    
    // Create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.backgroundColor = [UIColor whiteColor];
    self.layerView.frame = CGRectMake(self.view.frame.size.width/2 - self.layerView.frame.size.width/2, self.view.frame.size.height/2 - self.layerView.frame.size.height, self.layerView.frame.size.width, self.layerView.frame.size.height);
    
    // Add sublayer to the layer tree
    [self.layerView.layer addSublayer:blueLayer];
    
    // Add our view
    [self.view addSubview:self.layerView];
}


@end
