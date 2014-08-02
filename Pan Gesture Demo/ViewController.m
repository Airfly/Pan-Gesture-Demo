//
//  ViewController.m
//  Pan Gesture Demo
//
//  Created by Airfly Pan on 14-8-2.
//  Copyright (c) 2014年 Air Vision. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Pan Gesture
- (void)dragView:(UIPanGestureRecognizer *)pan {
    UIView *viewRelatively = self.view;
    UIView *viewWorking = pan.view;
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint offset = [pan translationInView:viewRelatively];
        [viewWorking setCenter:CGPointMake(viewWorking.center.x + offset.x, viewWorking.center.y + offset.y)];
        //clear translation
        [pan setTranslation:CGPointZero inView:viewRelatively];
    }
    else if(pan.state == UIGestureRecognizerStateEnded) {
        NSLog(@"finish pan...");
    }
    else if(pan.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"pan cancelled...");
    }
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //red one
    UIView *viewRed = [[UIView alloc] initWithFrame:CGRectMake(0,0,80,80)];
    [viewRed setBackgroundColor:[UIColor redColor]];
    [viewRed addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    [self.view addSubview:viewRed];
    [viewRed release];
    
    //green one
    UIView *viewGreen = [[UIView alloc] initWithFrame:CGRectMake(230,10,80,80)];
    [viewGreen setBackgroundColor:[UIColor greenColor]];
    [viewGreen addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    [self.view addSubview:viewGreen];
    [viewGreen release];
    
    //blue one
    UIView *viewBlue = [[UIView alloc] initWithFrame:CGRectMake(50,90,80,80)];
    [viewBlue setBackgroundColor:[UIColor blueColor]];
    [viewBlue addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    [self.view addSubview:viewBlue];
    [viewBlue release];
    
    //gray one
    UIView *viewGray = [[UIView alloc] initWithFrame:CGRectMake(150,120,80,80)];
    [viewGray setBackgroundColor:[UIColor grayColor]];
    [viewGray addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    [self.view addSubview:viewGray];
    [viewGray release];
    
    //button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(10,200,80,44)];
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    [self.view addSubview:button];
    
    //imageview
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon-76@2x.png"]];
    [image setFrame:CGRectMake(100, 200, 76, 76)];
    [image setUserInteractionEnabled:YES];
    [image addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    [self.view addSubview:image];
    [image release];
    
    //Lable
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,260,300,30)];
    [label setBackgroundColor:[UIColor blackColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:@"U can use pan gesture on every thing."];
    [label setUserInteractionEnabled:YES];
    [label addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    [self.view addSubview:label];
    [label release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
