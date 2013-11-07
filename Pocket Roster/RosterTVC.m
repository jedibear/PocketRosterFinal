//
//  RosterTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 4/20/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "RosterTVC.h"
#import "RosterCell.h"
#import "Get_Data_From_Website.h"

@interface RosterTVC ()

@end

@implementation RosterTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableDictionary*) footballTeamRoster{
    
    if(!_teamRoster){
        _teamRoster = [[NSMutableDictionary alloc] init];
    }
    return _teamRoster;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //need to give the URL here using self.incommingURL.
    self.teamRoster = [Get_Data_From_Website getInfo:self.incommingURL];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
-(void)initializeFootballTeamRoster{
    
    NSArray *images = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"FootballRosterPictures"];
    
    for (NSString *imagePath in images) {
        UIImage *anImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
        
        NSArray *componentsOfPath = [imagePath componentsSeparatedByString:@"/"];
        NSString *athleteInfo = [componentsOfPath lastObject];
        NSArray *componentsOfAthleteInfo = [athleteInfo componentsSeparatedByString:@"."];
        
        
        if (![[componentsOfAthleteInfo objectAtIndex:1]isEqualToString:@"jpg"]) {
            NSString *name = [componentsOfAthleteInfo objectAtIndex:0];
            NSString *position = [componentsOfAthleteInfo objectAtIndex:1];
            NSString *number = [componentsOfAthleteInfo objectAtIndex:2];
            NSString *yearOfGraduation = [componentsOfAthleteInfo objectAtIndex:3];
            self.key = [componentsOfAthleteInfo objectAtIndex:4];
            
            
            
            [self.footballTeamRoster setObject:[NSArray arrayWithObjects:name, position, number, yearOfGraduation, anImage,  nil] forKey:self.key];
            //NSLog(@"%@", imagePath);
        }
        
        
        //NSLog(@"%@", [self.footballTeamRoster objectForKey:self.number]);
        
        
        
        
        
    }
 
 
    
    NSArray *allKeys = [self.footballTeamRoster allKeys];
    
    
    NSLog(@"%@", allKeys);
    
    
    
    
    for (NSObject *key in allKeys) {
        NSLog(@"%@",  [self.footballTeamRoster objectForKey:key]);
    }
    
    
    for (int i = 0; i<100; i++) {
        
        
        self.key = [[NSString alloc]initWithFormat:@"%d", i];
        
        if ([self.footballTeamRoster objectForKey:self.key]) {
            NSLog(@"%@", [self.footballTeamRoster objectForKey:self.key]);
        }
    }
 
    
}
*/





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
    return [self.teamRoster count]-1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RosterCell";
    
    RosterCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    self.key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
    
    NSArray* athleteObjects = [self.teamRoster objectForKey:self.key];
    
    if(cell == nil && [athleteObjects objectAtIndex:0]!=nil ) {
        cell = [[RosterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    
    if ([athleteObjects objectAtIndex:0]!=nil) {
        NSString* athleteName = [[NSString alloc]initWithFormat:@"%@", [athleteObjects objectAtIndex:0]];
        NSString* athleteDetails = [[NSString alloc]initWithFormat:@"%@   %@    %@", [athleteObjects objectAtIndex:1],[athleteObjects objectAtIndex:3],[athleteObjects objectAtIndex:2]];
        UIImage* athletePic = [athleteObjects objectAtIndex:4];
        
        cell.athleteName.text = athleteName;
        cell.athleteDetails.text = athleteDetails;
        cell.athleteImage.image = athletePic;
        
        //NSLog(@"%lu", (unsigned long)[self.footballTeamRoster count]);
    }
    
    
    
    
    return cell;
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
