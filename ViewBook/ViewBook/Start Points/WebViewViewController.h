//
//  WebViewViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-19.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController {
    
    
}

// Web View
@property (weak, nonatomic) IBOutlet UIWebView *webView;


// Back Button
- (IBAction)sendBackToThumbnails:(id)sender;

@end
