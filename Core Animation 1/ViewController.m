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
@property CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Background color
    self.view.backgroundColor = [UIColor grayColor];
    
    // Create sublayer
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50, 50, 100, 100);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    // Set controller as layer delegate
    self.blueLayer.delegate = self;
    
    // Ensure that layer backing image uses correct scale
    self.blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.frame = CGRectMake(self.view.frame.size.width/2 - self.layerView.frame.size.width/2, self.view.frame.size.height/2 - self.layerView.frame.size.height, self.layerView.frame.size.width, self.layerView.frame.size.height);
    
    // Add layer to our view
    [self.layerView.layer addSublayer:self.blueLayer];
    
    // Redraw layer
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(updateLayer) userInfo:nil repeats:NO];
    
    // Add our view
    [self.view addSubview:self.layerView];
}

- (void)updateLayer
{
    // Force layer to redraw
    [self.blueLayer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    // Draw a thick red circle
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}


@end
