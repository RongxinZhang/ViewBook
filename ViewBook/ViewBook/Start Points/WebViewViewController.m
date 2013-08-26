//
//  WebViewViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController

// Synthesize Variables
@synthesize webView;

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
    
    // Embed the Video
    [self embedVimeo];
    
}


-(void)embedVimeo {
    
    NSString *embedHTML = @"<iframe width=\"300\" height=\"250\" src=\"http://player.vimeo.com/video/65436359\" frameborder=\"0\" allowfullscreen></iframe>";
        
    [webView loadHTMLString:embedHTML baseURL:nil];
    //[self.view addSubview:webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
