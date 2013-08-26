//
//  AlumniSurveyViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-17.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlumniSurveyViewController : UIViewController {
    
    // Screen Index
    NSInteger screenIndex;
    
    // Custom Font
    UIFont *titleFont, *paragraphFont;
    
}

// Back To Main Menu
- (IBAction)loadMainMenuStoryboard:(id)sender;

// Image View
@property (weak, nonatomic) IBOutlet UIImageView *slideshow;


@end
