//
//  SocialMediaViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialMediaViewController : UIViewController {
    
    // Screen Index
    NSInteger screenIndex;
    
}

// Page Title
@property (weak, nonatomic) IBOutlet UILabel *pageTitle;

// Social Media Buttons
- (IBAction)openFacebook:(id)sender;

- (IBAction)openTwitter:(id)sender;

- (IBAction)openInstragram:(id)sender;

- (IBAction)openGooglePlus:(id)sender;

@end
