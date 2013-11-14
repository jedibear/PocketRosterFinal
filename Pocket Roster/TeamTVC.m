//
//  TeamTVC.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/3/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "TeamTVC.h"
#import "GetTeamLinks.h"
#import "Get_Data_From_Website.h"
#import "GetRosterBIO.h"
#import "RosterSplashVC.h"
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

- (NSMutableDictionary *) teamRoster{
    if(!_teamRoster){
        _teamRoster = [[NSMutableDictionary alloc] init];
    }
    return _teamRoster;
}
/*
- (void) updateProgress:(NSTimer *)sender{
    UIProgressView *prog = [sender userInfo];
    
    if (prog.progress == 1.0) {
        [sender invalidate];
        
    }else{
        [prog setProgress:self.progress];
    }
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.teamLinks = [GetTeamLinks getTeamLinkBreakdown:self.incommingTeamURL];
    
    
    NSLog(@"%@", self.teamRoster);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
 
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
        
        
        if ([segue.destinationViewController isKindOfClass:[RosterSplashVC class]]) {
            
            //NSLog(@"HERE");
            
            
            
            RosterSplashVC *rVC = (RosterSplashVC *)segue.destinationViewController;

            if(!self.haveRoster){
                self.teamRoster = [Get_Data_From_Website getInfo:[self.teamLinks objectAtIndex:0]];
            }
            
            rVC.roster = self.teamRoster;
            rVC.longForm = self.longForm;
            rVC.backgroundImagePath = self.backgroundImagePath;
            rVC.teamName = self.teamName;
            rVC.incommingTeamURL = self.incommingTeamURL;
            rVC.haveRoster = self.haveRoster;
            
        }
    }else if ([segue.identifier isEqualToString:@"schedule/results"]) {
        
        if ([segue.destinationViewController isKindOfClass:[ScheduleViewController class]]) {
            ScheduleViewController *sVC = (ScheduleViewController *)segue.destinationViewController;
            sVC.schedURL =self.incommingTeamURL;
        }
    }else if ([segue.identifier isEqualToString:@"news"]) {
        
        if ([segue.destinationViewController isKindOfClass:[NewsFeedViewController class]]) {
            NewsFeedViewController *nFVC = (NewsFeedViewController *)segue.destinationViewController;
            if(self.longForm){
                nFVC.newsURL =[self.teamLinks objectAtIndex:3];
            }else{
                nFVC.newsURL = [self.teamLinks objectAtIndex:2];
            }
            nFVC.longForm = self.longForm;
            nFVC.backgroundImagePath = self.backgroundImagePath;
            nFVC.teamName = self.teamName;
            nFVC.incommingTeamURL = self.incommingTeamURL;
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
