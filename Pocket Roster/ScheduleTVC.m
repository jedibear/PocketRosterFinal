//
//  ScheduleTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 4/24/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScheduleTVC.h"
#import "ScheduleCell.h"
#import "GetSchedule.h"
#import "ScheduleViewController.h"

@interface ScheduleTVC ()

@end

@implementation ScheduleTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableDictionary*) scheduleInfo{
    
    if(!_scheduleInfo){
        _scheduleInfo = [[NSMutableDictionary alloc] init];
    }
    return _scheduleInfo;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scheduleInfo = [GetSchedule getSchedule:self.schedURL];
    NSLog(@"%@schedINFO",self.scheduleInfo);
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
    return [self.scheduleInfo count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ScheduleCell";
    ScheduleCell *cell = (ScheduleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    self.key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
    
    NSArray* contestObjects = [self.scheduleInfo objectForKey:self.key];
    
    //UITableViewCellStyle *scheduleStyle = [[UITableViewCellStyle alloc]]
    
    
    // Configure the cell...
    
    if([contestObjects objectAtIndex:0] != nil){
        NSString *date = [[NSString alloc] initWithFormat:@"%@", [contestObjects objectAtIndex:0]];
        
        NSString *opponent = [[NSString alloc] initWithFormat:@"%@", [contestObjects objectAtIndex:1]];
        NSString *result = [[NSString alloc] initWithFormat:@"%@", [contestObjects objectAtIndex:2]];
        
        cell.dateOfContest.text = date;
        
        //NSScanner *scan = [[NSScanner alloc]initWithString:opponent];
        //[scan scanUpToCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:nil];
        //[scan scanUpToString:@" " intoString:&opponent];
        
        cell.opponentName.text = opponent;
        cell.result.text = result;
        
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
