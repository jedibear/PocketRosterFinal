//
//  MasterTVC.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 11/3/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "MasterTVC.h"
#import "teams.h"
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
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensSoccerLongForm;
            teamVC.incommingTeamURL = mensSoccerStartingURL;
            teamVC.teamName = mensSoccerName;
            teamVC.backgroundImagePath = mensSoccerBackgroundImagePath;
            teamVC.schedBackground = mensSoccerBackgroundScheduleImagePath;
            teamVC.imageBackground = mensSoccerBackgroundPhotoImagePath;
            
        }
        
    }else if([segue.identifier isEqualToString:@"footballTVCInit"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = footballLongForm;
            teamVC.incommingTeamURL =footballStartingURL;
            teamVC.teamName = footballName;
            teamVC.backgroundImagePath = footballBackgroundImagePath;
            
            teamVC.schedBackground = footballBackgroundScheduleImagePath;
            teamVC.imageBackground = footballBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensNordicSki"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensNordicSkiing;
            teamVC.incommingTeamURL =mensNordicSkiStartingURL;
            teamVC.teamName = mensNordicSkiName;
            teamVC.backgroundImagePath = mensNordicSkiingBackgroundImagePath;
            
            teamVC.schedBackground = mensNordicSkiingBackgroundScheduleImagePath;
            teamVC.imageBackground = mensNordicSkiingBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensXCountryTVCInit"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensXCountryLongForm;
            teamVC.incommingTeamURL = mensXCountryStartingURL;
            teamVC.teamName = mensXCountryName;
            teamVC.backgroundImagePath = mensXCountryBackgroundImagePath;
            
            teamVC.schedBackground = mensXCountryBackgroundScheduleImagePath;
            teamVC.imageBackground = mensXCountryBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensGolfTVCInit"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensGolfLongForm;
            teamVC.incommingTeamURL = mensGolfStartingURL;
            teamVC.teamName = mensGolfName;
            teamVC.backgroundImagePath = mensGolfBackgroundImagePath;
            
            teamVC.schedBackground = mensGolfBackgroundScheduleImagePath;
            teamVC.imageBackground = mensGolfBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensSailingTVCInit"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensSailingLongForm;
            teamVC.incommingTeamURL = mensSailingStartingURL;
            teamVC.teamName = mensSailingName;
            teamVC.backgroundImagePath = mensSailingBackgroundImagePath;
            
            teamVC.schedBackground = mensSailingBackgroundScheduleImagePath;
            teamVC.imageBackground = mensSailingBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensTennisTVCInit"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensTennisLongForm;
            teamVC.incommingTeamURL = mensTennisStartingURL;
            teamVC.teamName = mensTennisName;
            teamVC.backgroundImagePath = mensTennisBackgroundImagePath;
            
            teamVC.schedBackground = mensTennisBackgroundScheduleImagePath;
            teamVC.imageBackground = mensTennisBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensSwimmingAndDiving"]){
       
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensSwimmingLongForm;
            teamVC.incommingTeamURL = mensSwimmingStartingURL;
            teamVC.teamName = mensSwimmingName;
            teamVC.backgroundImagePath = mensSwimmingBackgroundImagePath;
            
            teamVC.schedBackground = mensSwimmingBackgroundScheduleImagePath;
            teamVC.imageBackground = mensSwimmingBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensHockey"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensIceHockeyLongForm;
            teamVC.incommingTeamURL = mensIceHockeyStartingURL;
            teamVC.teamName = mensIceHockeyName;
            teamVC.backgroundImagePath = mensIceHockeyBackgroundImagePath;
            
            teamVC.schedBackground = mensIceHockeyBackgroundScheduleImagePath;
            teamVC.imageBackground = mensIceHockeyBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensBasketball"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensBasketballLongForm;
            teamVC.incommingTeamURL = mensBasketballStartingURL;
            teamVC.teamName = mensBasketballName;
            teamVC.backgroundImagePath = mensBasketballBackgroundImagePath;
            
            teamVC.schedBackground = mensBasketballBackgroundScheduleImagePath;
            teamVC.imageBackground = mensBasketballBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensIndoorTrack"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensTrackLongForm;
            teamVC.incommingTeamURL = mensTrackStartingURL;
            teamVC.teamName = mensIndoorTrackName;
            teamVC.backgroundImagePath = mensTrackBackgroundImagePath;
            
            teamVC.schedBackground = mensTrackBackgroundScheduleImagePath;
            teamVC.imageBackground = mensTrackBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensSquash"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensSquashLongForm;
            teamVC.incommingTeamURL = mensSquashStartingURL;
            teamVC.teamName = mensSquashName;
            teamVC.backgroundImagePath = mensSquashBackgroundImagePath;
            
            teamVC.schedBackground = mensSquashBackgroundScheduleImagePath;
            teamVC.imageBackground = mensSquashBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensLax"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensLacrosseLongForm;
            teamVC.incommingTeamURL = mensLacrosseStartingURL;
            teamVC.teamName = mensLacrosseName;
            teamVC.backgroundImagePath = mensLacrosseBackgroundImagePath;
            
            teamVC.schedBackground = mensLacrosseBackgroundScheduleImagePath;
            teamVC.imageBackground = mensLacrosseBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensTrack"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = mensTrackLongForm;
            teamVC.incommingTeamURL = mensTrackStartingURL;
            teamVC.teamName = mensTrackName;
            teamVC.backgroundImagePath = mensTrackBackgroundImagePath;
            
            teamVC.schedBackground = mensTrackBackgroundScheduleImagePath;
            teamVC.imageBackground = mensTrackBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"mensBaseball"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = baseballLongForm;
            teamVC.incommingTeamURL = baseballStartingURL;
            teamVC.teamName = baseballName;
            teamVC.backgroundImagePath = baseballBackgroundImagePath;
            
            teamVC.schedBackground = baseballBackgroundScheduleImagePath;
            teamVC.imageBackground = baseballBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wRugby"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensRugbyLongForm;
            teamVC.incommingTeamURL = womensRugbyStartingURL;
            teamVC.teamName = womensRugbyName;
            teamVC.backgroundImagePath = womensRugbyBackgroundImagePath;
            
            teamVC.schedBackground = womensRugbyBackgroundScheduleImagePath;
            teamVC.imageBackground = womensRugbyBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wSoccer"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensSoccerLongForm;
            teamVC.incommingTeamURL = womensSoccerStartingURL;
            teamVC.teamName = womensSoccerName;
            teamVC.backgroundImagePath = womensSoccerBackgroundImagePath;
            
            teamVC.schedBackground = womensSoccerBackgroundScheduleImagePath;
            teamVC.imageBackground = womensSoccerBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wXCountry"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensXCountryLongForm;
            teamVC.incommingTeamURL = womensXCountryStartingURL;
            teamVC.teamName = womensXCountryName;
            teamVC.backgroundImagePath = womensXCountryBackgroundImagePath;
            
            teamVC.schedBackground = womensXCountryBackgroundScheduleImagePath;
            teamVC.imageBackground = womensXCountryBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wGolf"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensGolfLongForm;
            teamVC.incommingTeamURL = womensGolfStartingURL;
            teamVC.teamName = womensGolfName;
            teamVC.backgroundImagePath = womensGolfBackgroundImagePath;
            
            teamVC.schedBackground = womensGolfBackgroundScheduleImagePath;
            teamVC.imageBackground = womensGolfBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wSailing"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensSailingLongForm;
            teamVC.incommingTeamURL = womensSailingStartingURL;
            teamVC.teamName = womensSailingName;
            teamVC.backgroundImagePath = womensSailingBackgroundImagePath;
            
            teamVC.schedBackground = womensSailingBackgroundScheduleImagePath;
            teamVC.imageBackground = womensSailingBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wTennis"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensTennisLongForm;
            teamVC.incommingTeamURL = womensTennisStartingURL;
            teamVC.teamName = womensTennisName;
            teamVC.backgroundImagePath = womensTennisBackgroundImagePath;
            
            teamVC.schedBackground = womensTennisBackgroundScheduleImagePath;
            teamVC.imageBackground = womensTennisBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wFieldHockey"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = fieldhockeyLongForm;
            teamVC.incommingTeamURL = fieldhockeyStartingURL;
            teamVC.teamName = fieldhockeyName;
            teamVC.backgroundImagePath = fieldHockeyBackgroundImagePath;
            
            teamVC.schedBackground = fieldHockeyBackgroundScheduleImagePath;
            teamVC.imageBackground = fieldHockeyBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wVolleyball"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensVolleyballLongForm;
            teamVC.incommingTeamURL = womensVolleyballStartingURL;
            teamVC.teamName = womensVolleyballName;
            teamVC.backgroundImagePath = womensVolleyballBackgroundImagePath;
            
            teamVC.schedBackground = womensVolleyballBackgroundScheduleImagePath;
            teamVC.imageBackground = womensVolleyballBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wSwimmingAndDiving"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensSwimmingLongForm;
            teamVC.incommingTeamURL = womensSwimmingStartingURL;
            teamVC.teamName = womensSwimmingName;
            teamVC.backgroundImagePath = womensSwimmingBackgroundImagePath;
            
            teamVC.schedBackground = womensSwimmingBackgroundScheduleImagePath;
            teamVC.imageBackground = womensSwimmingBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wHockey"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensIceHockeyLongForm;
            teamVC.incommingTeamURL = womensIceHockeyStartingURL;
            teamVC.teamName = womensIceHockeyName;
            teamVC.backgroundImagePath = womensIceHockeyBackgroundImagePath;
            
            teamVC.schedBackground = womensIceHockeyBackgroundScheduleImagePath;
            teamVC.imageBackground = womensIceHockeyBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wBasketball"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensBasketballLongForm;
            teamVC.incommingTeamURL = womensBasketballStartingURL;
            teamVC.teamName = womensBasketballName;
            teamVC.backgroundImagePath = womensBasketballBackgroundImagePath;
            
            teamVC.schedBackground = womensBasketballBackgroundScheduleImagePath;
            teamVC.imageBackground = womensBasketballBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wIndoorTrack"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensTrackLongForm;
            teamVC.incommingTeamURL = womensTrackStartingURL;
            teamVC.teamName = womensTrackName;
            teamVC.backgroundImagePath = womensTrackBackgroundImagePath;
            
            teamVC.schedBackground = womensTrackBackgroundScheduleImagePath;
            teamVC.imageBackground = womensTrackBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wSquash"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensSquashLongForm;
            teamVC.incommingTeamURL = womensSquashStartingURL;
            teamVC.teamName = womensSquashName;
            teamVC.backgroundImagePath = womensSquashBackgroundImagePath;
            
            teamVC.schedBackground = womensSquashBackgroundScheduleImagePath;
            teamVC.imageBackground = womensSquashBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wNordicSkiing"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensNordicSkiing;
            teamVC.incommingTeamURL = womensNordicStartingURL;
            teamVC.teamName = womensNordicSkiingName;
            teamVC.backgroundImagePath = womensNordicSkiingBackgroundImagePath;
            
            teamVC.schedBackground = womensNordicSkiingBackgroundScheduleImagePath;
            teamVC.imageBackground = womensNordicSkiingBackgroundPhotoImagePath;
            
        }
        
    }else if([segue.identifier isEqualToString:@"wLax"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensLacrosseLongForm;
            teamVC.incommingTeamURL = womensLacrosseStartingURL;
            teamVC.teamName = womensLacrosseName;
            teamVC.backgroundImagePath = womensLacrosseBackgroundImagePath;
            
            teamVC.schedBackground = womensLacrosseBackgroundScheduleImagePath;
            teamVC.imageBackground = womensLacrosseBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wTrack"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = womensTrackLongForm;
            teamVC.incommingTeamURL = womensTrackStartingURL;
            teamVC.teamName = womensTrackName;
            teamVC.backgroundImagePath = womensTrackBackgroundImagePath;
            
            teamVC.schedBackground = womensTrackBackgroundScheduleImagePath;
            teamVC.imageBackground = womensTrackBackgroundPhotoImagePath;
        }
        
    }else if([segue.identifier isEqualToString:@"wSoftball"]){
        
        if ([segue.destinationViewController isKindOfClass:[TeamViewController class]]) {
            TeamViewController *teamVC = (TeamViewController *) segue.destinationViewController;
            teamVC.longForm = softballLongForm;
            teamVC.incommingTeamURL = softballStartingURL;
            teamVC.teamName = softballName;
            teamVC.backgroundImagePath = softballBackgroundImagePath;
            
            teamVC.schedBackground = softballBackgroundScheduleImagePath;
            teamVC.imageBackground = softballBackgroundPhotoImagePath;
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
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
