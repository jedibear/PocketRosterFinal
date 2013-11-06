//
//  TeamTVC.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/3/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "TeamTVC.h"
#import "GetTeamLinks.h"
#import "RosterViewController.h"
#import "ScheduleViewController.h"
#import "NewsFeedViewController.h"
#import "CoachesViewController.h"
#import "FacilitiesViewController.h"
#import "RecordsViewController.h"

@interface TeamTVC ()

@end

@implementation TeamTVC

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //[GetTeamLinks getTeamLinkBreakdown];
	

	//sanity check
     NSLog(@"%@here", self.incommingTeamURL);
    
    // Get dem links
    NSURL *theURL = [[NSURL alloc] initWithString:self.incommingTeamURL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:theURL];
    
    NSData *dataFromURL = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    
    //get the data from the web page
    NSString * htmlFromURL = [[NSString alloc] initWithData:dataFromURL encoding:NSASCIIStringEncoding];
    
    
    
    NSString *linksString;
    
    
    NSString *rosterTabFinal;
    NSString *rosterTab;
    NSString *scheduleTab;
    NSString *scheduleTabFinal;
    NSString *newsTab;
    NSString *newsTabFinal;
    NSString *coachesTabFinal;
    NSString *coachesTab;
    NSString *facilitiesTabFinal;
    NSString *facilitiesTab;
    NSString *recordsTabFinal;
    NSString *recordsTab;
    
    
    
    int dumbVariable = 1;
    int numberOfElements = 0;
    
    self.teamLinks = [NSMutableArray new];
    
    NSScanner *miniScanner = [NSScanner scannerWithString:htmlFromURL];
    [miniScanner scanUpToString:@"navbar-secondary" intoString:NULL];
    [miniScanner scanUpToString:@"<div id=\"links-container\">" intoString:NULL];
    [miniScanner scanUpToString:@"</div>" intoString:&linksString];
    
    /**
     ********************************
     *            Roster            *
     ********************************
     */
    
    NSScanner *linkScanner = [NSScanner scannerWithString:linksString];
    [linkScanner scanUpToString:@">Home</a>" intoString:NULL];
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&rosterTab];
    rosterTabFinal = [rosterTab substringFromIndex: dumbVariable];
    NSLog(@"%@", rosterTabFinal);
    if (rosterTabFinal)
    {
        numberOfElements++;
        [self.teamLinks addObject:rosterTabFinal];
    }
    /**
     ********************************
     *        Schedule/Results      *
     ********************************
     */
    
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&scheduleTab];
    scheduleTabFinal = [scheduleTab substringFromIndex: dumbVariable];
    NSLog(@"%@", scheduleTabFinal);
    if (scheduleTabFinal)
    {
        numberOfElements++;
        [self.teamLinks addObject:scheduleTabFinal];
    }
    
    /**
     ********************************
     *             News             *
     ********************************
     */
    
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&newsTab];
    newsTabFinal = [newsTab substringFromIndex: dumbVariable];
    NSLog(@"%@", newsTabFinal);
    if (newsTabFinal)
    {
        numberOfElements++;
        [self.teamLinks addObject:newsTabFinal];
    }
    
    /**
     ********************************
     *             Coaches          *
     ********************************
     */
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&coachesTab];
    coachesTabFinal = [coachesTab substringFromIndex: dumbVariable];
    NSLog(@"%@", coachesTabFinal);
    if (coachesTabFinal)
    {
        numberOfElements++;
        [self.teamLinks addObject:coachesTabFinal];
    }
    
    /**
     ********************************
     *          Facilities          *
     ********************************
     */
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&facilitiesTab];
    facilitiesTabFinal = [facilitiesTab substringFromIndex: dumbVariable];
    NSLog(@"%@", facilitiesTabFinal);
    if (facilitiesTabFinal)
    {
        numberOfElements++;
        [self.teamLinks addObject:facilitiesTabFinal];
    }
    
    /**
     ********************************
     *            Records           *
     ********************************
     */
    [linkScanner scanUpToString:@"<a href=" intoString:NULL];
    [linkScanner scanUpToString:@"\"" intoString:NULL];
    [linkScanner scanUpToString:@"\">" intoString:&recordsTab];
    recordsTabFinal = [recordsTab substringFromIndex: dumbVariable];
    NSLog(@"%@", recordsTabFinal);
    if (recordsTabFinal)
    {
        numberOfElements++;
        [self.teamLinks addObject:recordsTabFinal];
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 *
 *  Prepare the segue to the appropriate view the user is looking to navigate to. Right now
 *  just the incommingURL is passed. The specific naviagtion found above will have to be appended
 *  to a string to get the full URL to be passed. String will be converted to an actual URL in
 *  the destination view controller.
 *
 */


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"roster"]) {
	//not sure if this is the right class, nothing is in RosterViewController right now.         
	//football roster no longer works/ was using pics, need to pull from site
        if ([segue.destinationViewController isKindOfClass:[RosterViewController class]]) {
            RosterViewController *rVC = (RosterViewController *)segue.destinationViewController;
            rVC.rosterURL =self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"schedule/results"]) {
        
        if ([segue.destinationViewController isKindOfClass:[ScheduleViewController class]]) {
            ScheduleViewController *sVC = (ScheduleViewController *)segue.destinationViewController;
            sVC.schedURL =self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"news"]) {
        
        if ([segue.destinationViewController isKindOfClass:[NewsFeedViewController class]]) {
            NewsFeedViewController *nFVC = (NewsFeedViewController *)segue.destinationViewController;
            nFVC.newsURL =self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"coaches"]) {
        
	if ([segue.destinationViewController isKindOfClass:[CoachesViewController class]]) {
            CoachesViewController *cVC = (CoachesViewController *)segue.destinationViewController;
            cVC.coachesURL =self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"facilities"]) {
        
	if ([segue.destinationViewController isKindOfClass:[FacilitiesViewController class]]) {
            FacilitiesViewController *fVC = (FacilitiesViewController *)segue.destinationViewController;
            fVC.facilitiesURL =self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"records"]) {
        
        if ([segue.destinationViewController isKindOfClass:[RecordsViewController class]]) {
            RecordsViewController *rEVC = (RecordsViewController *)segue.destinationViewController;
            rEVC.recordsURL =self.incommingTeamURL;
        }
    }
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
