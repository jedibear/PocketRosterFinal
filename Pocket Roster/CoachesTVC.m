//
//  CoachesTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/6/13.
//  Copyright (c) 2013 James P. Garvey. All rights reserved.
//

#import "CoachesTVC.h"
#import "GetCoaches.h"
#import "CoachesCell.h"
#import "CoachesBioViewController.h"

@interface CoachesTVC ()

@end

@implementation CoachesTVC

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

    self.coaches = [GetCoaches getCoaches:self.coachesURL];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.coaches count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CoachesCell";
    CoachesCell *cell = (CoachesCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]];
    
    NSMutableDictionary *details = [self.coaches objectForKey:key];
    
    cell.coachesName.text = [details objectForKey:@"name"];
    cell.coachPic.image = [details objectForKey:@"image"];
    cell.coachesPosition.text = [details objectForKey:@"position"];
    
    // Configure the cell...
    
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        //RosterCell *cell = sender;
        if(indexPath){
            
            if ([segue.identifier isEqualToString:@"coachBio"]) {
                if ([segue.destinationViewController isKindOfClass:[CoachesBioViewController class]]) {
                    
                    CoachesBioViewController *rAVC = (CoachesBioViewController *)segue.destinationViewController;
                    
                    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]];
                    NSMutableDictionary *athleteObjects = [self.coaches objectForKey:key];
                    
                    
                    rAVC.athleteName = [athleteObjects objectForKey:@"name"];
                    
                    
                    
                    rAVC.bio = [athleteObjects objectForKey:@"bio"];
                    rAVC.athleteImageInput = [athleteObjects objectForKey:@"image"];
                    rAVC.incommingURL = self.coachesURL;
                    rAVC.haveRoster = self.haveRoster;
                    rAVC.roster = self.roster;
                    rAVC.teamName = self.teamName;
                    rAVC.longForm = self.longForm;
                    rAVC.incommingTeamURL = self.incommingTeamURL;
                    rAVC.backgroundImagePath = self.backgroundImagePath;
                }
            }
            
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
