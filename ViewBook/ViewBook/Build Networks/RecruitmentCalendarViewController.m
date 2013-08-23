//
//  RecruitmentCalendarViewController.m
//  ViewBook
//
//  Created by Jesse Scott on 2013-08-18.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import "RecruitmentCalendarViewController.h"
#import "RecruitmentCalenderCell.h"


@interface RecruitmentCalendarViewController ()

@end

@implementation RecruitmentCalendarViewController

@synthesize eventTimes;
@synthesize currentKey, currentStringValue;
@synthesize xmlDate, xmlTime, xmlPlace;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.eventTimes = [[NSMutableArray alloc]init];
    
    [self.eventTimes addObject:@"16-10-2013 4:15 PM"];
    [self.eventTimes addObject:@"16-11-2013 4:17 PM"];
    [self.eventTimes addObject:@"19-08-2013 4:19 PM"];
    
    for (NSString *date in self.eventTimes) {
        NSLog(@"Array values: %@", date);
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // XML Path
    NSString *URLString = @"http://www.jesses.co.tt/storage/recruitments.xml";
    NSURL *URL = [NSURL URLWithString: [URLString stringByAddingPercentEscapesUsingEncoding:
                   NSASCIIStringEncoding]];
    
    // Cast XML into Data
    NSData *dataXML = [NSData dataWithContentsOfURL:URL];
    
    // Save File
    NSString *applicationDocumentsDir =
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *storePath = [applicationDocumentsDir stringByAppendingPathComponent:@"recruitments.xml"];
    [dataXML writeToFile:storePath atomically:TRUE];
    
    // Read Data
    NSData *savedXML = [NSData dataWithContentsOfFile:storePath];
    
    // Parse XML
    NSXMLParser *NSXmlParser = [[NSXMLParser alloc] initWithData:savedXML];
    
    XMLParser *xmlParser = [[XMLParser alloc] initXMLParser];
    
    [NSXmlParser setDelegate:xmlParser];
    
    BOOL success = [NSXmlParser parse];
    NSLog(@"Was The Parser Successful? ... %d", success);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// XML STUFF
/*
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    NSLog(@"didStartElement");
    currentKey = nil;
    currentStringValue = nil;
    
    if([elementName isEqualToString:@"dates"]){
        if([elementName isEqualToString:@"file"]){
            xmlDate = elementName;
            return;
        }
    }
    
    if([elementName isEqualToString:@"times"]){
        if([elementName isEqualToString:@"file"]){
            xmlTime = elementName;
            return;
        }
    }
    
    if([elementName isEqualToString:@"places"]){
        if([elementName isEqualToString:@"file"]){
            xmlPlace = elementName;
            return;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"foundCharacters");
    if(currentKey){
        if(!currentStringValue){
            currentStringValue = [[NSMutableString alloc] initWithCapacity:200];
        }
        else {
            //[currentStringValue appendString:string];
        }
    }
}
 
 -(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
     NSLog(@"didEndElement");
     if([elementName isEqualToString:@"Signature"] && [currentStringValue intValue] == 804){
         //ivar.signature = [currentStringValue intValue];
         return;
     }
 }
 */

// TABLE STUFF

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    //RX Creates Calender Cell
    RecruitmentCalenderCell *calenderCell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!calenderCell) {
        calenderCell = [[RecruitmentCalenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    calenderCell.textLabel.text = [self.eventTimes objectAtIndex:indexPath.row];
    
    //RX Creates button - tutorial: http://www.youtube.com/watch?v=TADTYkqF6q4
    UIButton *saveButton = [[UIButton alloc]initWithFrame:CGRectMake(210, 10, 60, 40)];
    [saveButton addTarget:self action:@selector(savePressed:) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setBackgroundColor:[UIColor blackColor]];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];

    [calenderCell addSubview:saveButton];
    [calenderCell setIndentationWidth:45];
    [calenderCell setIndentationLevel:2];
           
    return calenderCell;
}

//RX Button Click action
-(void)savePressed:(UIButton *)sender{
    UITableViewCell *cell = ((UITableViewCell *)[sender superview]);
    NSInteger cellRow = [[self.tableView indexPathForCell:cell] row];
    NSLog(@"Button Number: %i",cellRow);
    [self createLocalNotifications:cell rowNumber:cellRow];
}

//RX Creates multiple Local Notifications 
-(void)createLocalNotifications:(UITableViewCell *)currentCell rowNumber:(NSInteger)rowNumber{
    
    NSString *cellTextLabel = currentCell.textLabel.text;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy hh:mm a"];    //RX Main Date format
    NSDate *date = [dateFormatter dateFromString:cellTextLabel];
    NSLog(@"date: %@",date);

    NSString *message = @"There is an Emily carr Event happening now";

    [self scheduleLocalNotificationWithDate:date: message];
    
}

//RX creates local notification
-(void)scheduleLocalNotificationWithDate:(NSDate *)fireDate :(NSString *)alertMessage{
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    
    notification.fireDate = fireDate;
    notification.alertBody = alertMessage;
//    notification.repeatInterval = NSDayCalendarUnit;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    [self showMessage:@"A Reminder has been set"];
    
}

//RX Creates alert to notify user that notification has been set
- (void)showMessage:(NSString *)bodyTexts{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Reminder"
                                                     message :bodyTexts
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
