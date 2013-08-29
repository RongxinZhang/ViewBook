//
//  CommunityViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "PublicEngagementViewController.h"

@interface PublicEngagementViewController ()

@end

@implementation PublicEngagementViewController

// Synthesize Variables

@synthesize mainParagraph;
@synthesize pageTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
	// Do any additional setup after loading the view.
    
    // Set Screen Index
    screenIndex = 2;
    
    // Load Fonts
    titleFont = [UIFont fontWithName:@"Leitura Headline" size:24];
    paragraphFont = [UIFont fontWithName:@"LeituraSans-Grot 1" size:12];
    
    // Load PList For Page Title
    NSString *pathToPlistFile = [[NSBundle mainBundle] pathForResource:@"BuildNetworksScreenNames" ofType:@"plist"];
    NSArray *screenNames = [[NSArray alloc] initWithContentsOfFile:pathToPlistFile];
    
    // Set PList To Page Title
//    pageTitle.text = [screenNames objectAtIndex:screenIndex];
    self.pageTitle.font= [UIFont fontWithName:@"LeituraSans-Grot 1" size:24];
    self.pageTitle.text=@"hello";
//    pageTitle.font = [UIFont fontWithName:@"LeituraHeadline-Serif It" size:24];
    //pageTitle.font = titleFont;
    
    // Load Text File For Main Paragraph
    NSString *pathToTextFile = [[NSBundle mainBundle] pathForResource:@"PublicEngagement" ofType:@"txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:pathToTextFile encoding:NSUTF8StringEncoding error:NULL];
    
    // Set Text File To Main Paragraph Label
    mainParagraph.editable = NO;
    mainParagraph.text = fileContent;
    mainParagraph.font = [UIFont fontWithName:@"LeituraSans-Grot 1" size:12];
    //mainParagraph.font = [UIFont systemFontOfSize:24];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
