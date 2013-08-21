//
//  SocialMediaViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "SocialMediaViewController.h"

@interface SocialMediaViewController ()

@end

@implementation SocialMediaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Button Methods

- (IBAction)openFacebook:(id)sender {
    // URL's
    NSURL *facebookApp = [NSURL URLWithString:@"fb://page/Emily.Carr.University"];
    NSURL *facebookWeb = [NSURL URLWithString:@"http://www.facebook.com/Emily.Carr.University"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:facebookApp]) {
        [[UIApplication sharedApplication] openURL:facebookApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:facebookWeb];
    }
}

- (IBAction)openTwitter:(id)sender {
    // URL's
    NSURL *twitterApp = [NSURL URLWithString:@"twitter://user?screen_name=EmilyCarrU"];
    NSURL *twitterWeb = [NSURL URLWithString:@"http://twitter.com/EmilyCarrU"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:twitterApp]) {
        [[UIApplication sharedApplication] openURL:twitterApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:twitterWeb];
    }
}

- (IBAction)openInstragram:(id)sender {
    // URL's
    NSURL *instagramApp = [NSURL URLWithString:@"instagram://user?username=USERNAME"];
    NSURL *instagramWeb = [NSURL URLWithString:@"http://twitter.com/EmilyCarrU"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:instagramApp]) {
        [[UIApplication sharedApplication] openURL:instagramApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:instagramWeb];
    }
}

- (IBAction)openGooglePlus:(id)sender {
    // URL's
    NSURL *gplusApp = [NSURL URLWithString:@"googleplus://"];
    NSURL *gplusWeb = [NSURL URLWithString:@"http://plus.google.com/u/0/101682024092527104043/posts"];
    
    // Open The App ?
    if ([[UIApplication sharedApplication] canOpenURL:gplusApp]) {
        [[UIApplication sharedApplication] openURL:gplusApp];
    }
    // ... Or Website
    else {
        [[UIApplication sharedApplication] openURL:gplusWeb];
    }
}


@end
