//
//  ViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-07-13.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "SplashViewController.h"
#import "MainMenuViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

// Synthesize Properties
@synthesize timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Timer
    if(self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(switchView) userInfo:nil repeats:NO];
    }
    
}

// Switch View
- (void) switchView {
    NSLog(@"TIMES UP !!");

    // Segue
    [self performSegueWithIdentifier:@"timerDone" sender:self];
    
    // Kill Timer
    [timer invalidate];
    self.timer = nil;       
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
