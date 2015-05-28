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
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.backgroundColor = [UIColor blueColor];
    self.layerView.frame = CGRectMake(self.view.frame.size.width/2 - self.layerView.frame.size.width/2, self.view.frame.size.height/2 - self.layerView.frame.size.height, self.layerView.frame.size.width, self.layerView.frame.size.height);
    
    // Add our view
    [self.view addSubview:self.layerView];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(transform) userInfo:nil repeats:NO];
}

- (void)transform
{
    // Creating a compound transform using several functions
    
    // Create a new transform
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    // Scale by 50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    
    // Rotate by 30 degrees
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    
    // Translate by 200 points
    transform = CGAffineTransformTranslate(transform, 200, 0);
    
    // Apply transform to layer
    self.layerView.layer.affineTransform = transform;
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
