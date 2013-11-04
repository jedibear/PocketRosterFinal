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
        self.teamURL = @"http://athletics.bowdoin.edu/sports/msoc/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
        }
        
    }else if([segue.identifier isEqualToString:@"footballTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/fball/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
        }
        
    }else if([segue.identifier isEqualToString:@"mensXCountryTVCInit"]){
        self.teamURL = @"hhttp://athletics.bowdoin.edu/sports/mxc/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
        }
        
    }else if([segue.identifier isEqualToString:@"mensRugbyTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mrugby/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
        }
        
    }else if([segue.identifier isEqualToString:@"mensGolfTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mgolf/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
        }
        
    }else if([segue.identifier isEqualToString:@"mensSailingTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/sailing/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
        }
        
    }else if([segue.identifier isEqualToString:@"mensTennisTVCInit"]){
        self.teamURL = @"http://athletics.bowdoin.edu/sports/mten/index";//change this
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.incommingTeamURL = self.teamURL;
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
