//
//  XMLParser.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-22.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "XMLParser.h"

@interface XMLParser ()



@end

@implementation XMLParser


// Synthesize Variables
@synthesize currentEvent, cumulativeEvents;


-(XMLParser *)initXMLParser {
    //[super init];
    
    // Init Strings
    currentEvent = [[NSMutableString alloc] init];
    cumulativeEvents = [[NSMutableArray alloc] init];
    
    return self;
}

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"didStartDocument");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"didEndDocument");
    NSLog(@"Cumulative Events Are %@", cumulativeEvents);
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    NSLog(@"didStartElement: %@", elementName);
    
    if (namespaceURI != nil)
        NSLog(@"namespace: %@", namespaceURI);
    
    if (qName != nil)
        NSLog(@"qualifiedName: %@", qName);
    
    if([elementName isEqualToString:@"event"]){
        // Clear String
        [currentEvent setString:@""];
    }
    

    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)characters {
    NSLog(@"Found Characters: %@", characters);

    if([characters length] > 0) {
        [currentEvent appendString: [characters stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    }
    NSLog(@"Event: %@", currentEvent);

}

- (void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString {
    NSLog(@"Found Whitespace");
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"didEndElement: %@", elementName);
    
    if([elementName isEqualToString:@"date"]){
        //
        NSString *comma = @", ";
        [currentEvent appendString:comma];
    }
    
    if([elementName isEqualToString:@"time"]){
        //
        NSString *comma = @", ";
        [currentEvent appendString:comma];
    }
    
    if([elementName isEqualToString:@"place"]){
        NSLog(@"End Of An Event");

        // Add The String To The Array
        NSString *tempEvent = currentEvent;
        [cumulativeEvents addObject: tempEvent];
        
        for (NSString *event in cumulativeEvents) {
            NSLog(@"This Is An Event: %@", event);
        }
        
    }
    
    
    
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"XMLParser error: %@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    NSLog(@"XMLParser error: %@", [validationError localizedDescription]);
}



@end
