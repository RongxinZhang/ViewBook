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
@synthesize currentDate, currentTime, currentPlace;
@synthesize cumulativeDate, cumulativeTime, cumulativePlace;

-(XMLParser *)initXMLParser {
    //[super init];
    
    return self;
}

-(BOOL)parseDocumentWithData:(NSData *)data {
    if (data == nil)
        return NO;
    
    // this is the parsing machine
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:data];
    
    // this class will handle the events
    [xmlparser setDelegate:self];
    [xmlparser setShouldResolveExternalEntities:NO];
    
    // now parse the document
    BOOL ok = [xmlparser parse];
    if (ok == NO)
        NSLog(@"error");
    else
        NSLog(@"OK");
    
    return ok;
}

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"didStartDocument");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"didEndDocument");
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    NSLog(@"didStartElement: %@", elementName);
    
    if (namespaceURI != nil)
        NSLog(@"namespace: %@", namespaceURI);
    
    if (qName != nil)
        NSLog(@"qualifiedName: %@", qName);
    
    // print all attributes for this element
    NSEnumerator *attribs = [attributeDict keyEnumerator];
    NSString *key, *value;
    
    while((key = [attribs nextObject]) != nil) {
        value = [attributeDict objectForKey:key];
        NSLog(@"  attribute: %@ = %@", key, value);
    }

    if([elementName isEqualToString:@"date"]){
        NSLog(@"Date is %@", elementName);

    }
    
    if([elementName isEqualToString:@"time"]){
        NSLog(@"Time is %@", elementName);

    }
    
    if([elementName isEqualToString:@"place"]){
        NSLog(@"Place is %@", elementName);

    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)elementName {
    NSLog(@"Found Characters: %@", elementName);

    if ([elementName isEqualToString:@"date"]) {
        //[currentDate appendString:elementName];
    } else if ([elementName isEqualToString:@"time"]) {
        //[cumulativeTime appendString:elementName];
    } else if ([elementName isEqualToString:@"place"]) {
        //[cumulativePlace appendString:elementName];
    }

}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"didEndElement: %@", elementName);
}

// error handling
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"XMLParser error: %@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    NSLog(@"XMLParser error: %@", [validationError localizedDescription]);
}



@end
