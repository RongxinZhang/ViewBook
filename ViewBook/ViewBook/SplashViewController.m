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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Timer
    if(self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(switchView) userInfo:nil repeats:NO];
    }
    
    
    
}

// Switch View

- (void) switchView {
    NSLog(@"TIMES UP !!");
    
//    MainMenuViewController *menuView = [[MainMenuViewController alloc] init];
//    menuView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:menuView animated:YES completion:NULL];
    
    //
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    MainMenuViewController *menuView = (MainMenuViewController *)[storyboard instantiateViewControllerWithIdentifier:@"menuView"];
    [self.navigationController pushViewController:menuView animated:YES];
    
    // Kill Timer
    [timer invalidate];
    self.timer = nil;   
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
