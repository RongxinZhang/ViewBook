//
//  VideoThumbnailViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-25.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "VideoThumbnailViewController.h"
#import "WebViewViewController.h"

@interface VideoThumbnailViewController ()

@end

@implementation VideoThumbnailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    vimeoURL = [[NSString alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Sending..");
    if([segue.identifier isEqualToString:@"playCreativeFuture"]) {
        WebViewViewController *controller = (WebViewViewController *)segue.destinationViewController;
        controller.vimeoURL = vimeoURL;
    }
}

- (IBAction)launchCreativeFuture:(id)sender {
    vimeoURL = @"72053500";
    NSLog(@"The URL sent is %@", vimeoURL);
    [self performSegueWithIdentifier:@"playCreativeFuture" sender:sender];
}

- (IBAction)launchDayInTheLife:(id)sender {
}

- (IBAction)launchDesignCommunity:(id)sender {
}

- (IBAction)launchErinBoniferro:(id)sender {
}

- (IBAction)launchGiantAnt:(id)sender {
}

- (IBAction)launchLukeParnell:(id)sender {
}
@end
