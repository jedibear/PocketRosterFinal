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
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Soccer";
            teamVC.backgroundImagePath = @"Pocket Roster/MSoccer.jpg";
            
        }
        
    }else if([segue.identifier isEqualToString:@"footballTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/fball/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Football";
        }
        
    }else if([segue.identifier isEqualToString:@"mensXCountryTVCInit"]){
        self.teamURL = @"hhttp://athletics.bowdoin.edu/sports/mxc/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Cross Country";
        }
        
    }else if([segue.identifier isEqualToString:@"mensRugbyTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mrugby/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Rugby";
        }
        
    }else if([segue.identifier isEqualToString:@"mensGolfTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mgolf/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Golf";
        }
        
    }else if([segue.identifier isEqualToString:@"mensSailingTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/sailing/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Sailing";
        }
        
    }else if([segue.identifier isEqualToString:@"mensTennisTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Tennis";
        }
        
    }else if([segue.identifier isEqualToString:@"mensSwimmingAndDiving"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Swimming And Diving";
        }
        
    }else if([segue.identifier isEqualToString:@"mensHockey"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Hockey";
        }
        
    }else if([segue.identifier isEqualToString:@"mensBasketball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Basketball";
        }
        
    }else if([segue.identifier isEqualToString:@"mensIndoorTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Indoor Track";
        }
        
    }else if([segue.identifier isEqualToString:@"mensSquash"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Squash";
        }
        
    }else if([segue.identifier isEqualToString:@"mensLax"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Lacrosse";
        }
        
    }else if([segue.identifier isEqualToString:@"mensTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Track";
        }
        
    }else if([segue.identifier isEqualToString:@"mensBaseball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Baseball";
        }
        
    }else if([segue.identifier isEqualToString:@"wRugby"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Rugby";
        }
        
    }else if([segue.identifier isEqualToString:@"wSoccer"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Soccer";
        }
        
    }else if([segue.identifier isEqualToString:@"wXCountry"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Cross Country";
        }
        
    }else if([segue.identifier isEqualToString:@"wGolf"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Golf";
        }
        
    }else if([segue.identifier isEqualToString:@"wSailing"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Sailing";
        }
        
    }else if([segue.identifier isEqualToString:@"wTennis"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Tennis";
        }
        
    }else if([segue.identifier isEqualToString:@"wFieldHockey"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"FieldHockey";
        }
        
    }else if([segue.identifier isEqualToString:@"wVolleyball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Volleyball";
        }
        
    }else if([segue.identifier isEqualToString:@"wSwimmingAndDiving"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Swimming And Diving";
        }
        
    }else if([segue.identifier isEqualToString:@"wHockey"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Hockey";
        }
        
    }else if([segue.identifier isEqualToString:@"wBasketball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Basketball";
        }
        
    }else if([segue.identifier isEqualToString:@"wIndoorTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Indoor Track";
        }
        
    }else if([segue.identifier isEqualToString:@"wSquash"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Squash";
        }
        
    }else if([segue.identifier isEqualToString:@"wNorticSkiing"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Nortic Skiing";
        }
        
    }else if([segue.identifier isEqualToString:@"wLax"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Lacrosse";
        }
        
    }else if([segue.identifier isEqualToString:@"wTrack"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Track";
        }
        
    }else if([segue.identifier isEqualToString:@"wSoftball"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
            teamVC.teamName = @"Softball";
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
