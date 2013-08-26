//
//  GNWViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-25.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "GNWViewController.h"

@interface GNWViewController ()

@end

@implementation GNWViewController

// Synthesize Variables
@synthesize pageTitle, mainParagraph;
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
    
    // Set Screen Index
    screenIndex = 0;
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"CreateFuturesScreenNames" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
    pageTitle.text = [screenNames objectAtIndex:screenIndex];
    
    // Load Text File For Main Paragraph
    NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:@"GreatNorthernWay" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
    
    // Set Text File To Main Paragraph Label
    mainParagraph.numberOfLines = 25;
    mainParagraph.text = fileContent;
    
    // Embed the Video
    [self embedVimeo];
    
}

-(void)embedVimeo {
    
    NSString *embedHTML = @"<iframe width=\"300\" height=\"250\" src=\"http://player.vimeo.com/video/58030254\" frameborder=\"0\" allowfullscreen></iframe>";
    
    [webView loadHTMLString:embedHTML baseURL:nil];
    //[self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
