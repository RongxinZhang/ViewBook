//
//  RecruitmentCalendarViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecruitmentCalendarViewController : UITableViewController {
    
    // Screen Index
    NSInteger screenIndex;
    
}

@property (strong, nonatomic) NSMutableArray *eventTimes;
@property (strong, nonatomic) NSString *currentKey;
@property (strong, nonatomic) NSString *currentStringValue;
@property (nonatomic, retain) NSString *xmlDate;
@property (nonatomic, retain) NSString *xmlTime;
@property (nonatomic, retain) NSString *xmlPlace;

@end
