//
//  MasterTVC.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/3/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "MasterTVC.h"
#import "TeamViewController.h"

@interface MasterTVC ()

@end

@implementation MasterTVC

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
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"mensSoccerTVCInit"]) {
        self.teamURL = @"http://athletics.bowdoin.edu/sports/msoc/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Soccer";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MSoccer" ofType:@"jpg"];
            
        }
        
    }else if([segue.identifier isEqualToString:@"footballTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/fball/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = @"http://athletics.bowdoin.edu/sports/fball/index";
            teamVC.teamName = @"Football";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MFootball" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensXCountryTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mxc/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Cross Country";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MCrossCountry" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensRugbyTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mrugby/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Rugby";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MSoccer" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensGolfTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mgolf/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Golf";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MGolf" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensSailingTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/sailing/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Sailing";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MSailing" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensTennisTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Tennis";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MTennis" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensSwimmingAndDiving"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mswimdive/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Swimming And Diving";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MSwimming" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensHockey"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mice/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Hockey";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MHockey" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensBasketball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mbkb/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Basketball";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MBacketball" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensIndoorTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mtrack/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Indoor Track";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MTrack" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensSquash"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/msquash/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Squash";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MSquash" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensLax"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mlax/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Lacrosse";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"BLax" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mtrack/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Track";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MTrack" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"mensBaseball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/bsb/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Baseball";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"MBaseball" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wRugby"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wrugby/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Rugby";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WRugby" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wSoccer"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wsoc/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Soccer";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WSoccer" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wXCountry"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wxc/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Cross Country";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WCrossCountry" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wGolf"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wgolf/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Golf";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WGolf" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wSailing"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/sailing/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Sailing";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WSailing" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wTennis"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wten/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Tennis";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WTennis" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wFieldHockey"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/fh/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"FieldHockey";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WFeildHockey" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wVolleyball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wvball/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Volleyball";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WVolleyball" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wSwimmingAndDiving"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wswimdive/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Swimming And Diving";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WSwimming" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wHockey"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wice/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Hockey";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WHockey" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wBasketball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wbkb/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Basketball";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WBasketball" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wIndoorTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wtrack/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Indoor Track";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WTrack" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wSquash"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wsquash/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Squash";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WSquash" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wNorticSkiing"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/nordicski/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Nortic Skiing";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WSkiing" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wLax"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wlax/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Lacrosse";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WLax" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/wtrack/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = NO;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Track";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WTrack" ofType:@"jpg"];
        }
        
    }else if([segue.identifier isEqualToString:@"wSoftball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/sball/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = YES;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Softball";
            teamVC.backgroundImagePath = [[NSBundle mainBundle] pathForResource:@"WSoftball" ofType:@"jpg"];
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
