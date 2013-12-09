//
//  ScoreboardTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/15/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScoreboardTVC.h"
#import "GetScoreBoard.h"
#import "ScoreboardCell.h"

@interface ScoreboardTVC ()

@end

@implementation ScoreboardTVC

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
    
    self.incommingScheduleURL = @"http://athletics.bowdoin.edu/landing/index";
    
    self.scoreboard = [[NSMutableDictionary alloc]init];
    self.scoreboard = [GetScoreBoard getTheScoreBoard:self.incommingScheduleURL];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];

    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
    //NSLog(@"%@", self.scoreboard);
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

- (void) refresh: (UIRefreshControl *)sender{
    
    sender.attributedTitle = [[NSAttributedString alloc]initWithString:@"Refreshing Scoreboard..."];
    
    self.scoreboard = [GetScoreBoard getTheScoreBoard:@"http://athletics.bowdoin.edu/landing/index"];
    
    [self.scoreboard removeObjectForKey:@"1"];
    NSLog(@"%@here", self.scoreboard);
    
    [self.tableView reloadData];
    
    [(UIRefreshControl *)sender endRefreshing];
    
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
    //NSLog(@"%@", self.scoreboard);
    return [self.scoreboard count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ScoreboardCell";
    ScoreboardCell *cell = (ScoreboardCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
    
    // Configure the cell...
    
    
    
    
    NSMutableDictionary *contestObjects = [self.scoreboard objectForKey:key];
    
    
    cell.sportLabel.text = [contestObjects objectForKey:@"sport"];
    cell.team1.text = [contestObjects objectForKey:@"team1"];
    cell.team2.text = [contestObjects objectForKey:@"team2"];
    cell.date.text = [contestObjects objectForKey:@"date"];
    cell.score1.text = [contestObjects objectForKey:@"score1"];
    cell.score2.text = [contestObjects objectForKey:@"score2"];
    cell.status.text = [contestObjects objectForKey:@"status"];
    
    
    
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
