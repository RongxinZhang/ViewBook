//
//  XMLParser.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-22.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSXMLParser.h>
#import "RecruitmentEvent.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
        
}

// Methods
-(XMLParser *)initXMLParser;
-(BOOL)parseDocumentWithData:(NSData *)data;

// Date
@property (strong, nonatomic) NSMutableArray *cumulativeDate;
@property (nonatomic, retain) NSString *currentDate;

// Time
@property (strong, nonatomic) NSMutableArray *cumulativeTime;
@property (nonatomic, retain) NSString *currentTime;

// Place
@property (strong, nonatomic) NSMutableArray *cumulativePlace;
@property (nonatomic, retain) NSString *currentPlace;

@end
