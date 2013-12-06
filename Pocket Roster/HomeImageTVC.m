//
//  HomeImageTVC.m
//  Pocket Roster
//
//  Created by James P. Garvey on 11/18/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "HomeImageTVC.h"
#import "GetAlbums.h"
#import "HomeImageCell.h"
#import "ImagesCollectionContainerViewController.h"

@interface HomeImageTVC ()

@end

@implementation HomeImageTVC

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
    [self.load startAnimating];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (self.haveAlbums) {
        NSLog(@"yup homeImageTVC");
    }
    NSLog(@"homeImageTVC %@", self.schedBackground);
    if(!self.haveAlbums){
        self.albums = [GetAlbums getAllAlbums:self.inputURL];
        self.haveAlbums = YES;
    }
    
    
    [self.load stopAnimating];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.albums count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ImageCell";
    HomeImageCell *cell = (HomeImageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
    NSMutableDictionary *details = [self.albums objectForKey:key];
    cell.albumName.text = [details objectForKey:@"title"];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        //RosterCell *cell = sender;
        if(indexPath){
            
            if ([segue.identifier isEqualToString:@"album"]) {
                if ([segue.destinationViewController isKindOfClass:[ImagesCollectionContainerViewController class]]) {
                    
                    ImagesCollectionContainerViewController *rAVC = (ImagesCollectionContainerViewController *)segue.destinationViewController;
                    
                    NSString *key = [[NSString alloc] initWithFormat:@"%ld", (long)[indexPath row]+1];
                    NSMutableDictionary *athleteObjects = [self.albums objectForKey:key];
                    
                    NSLog(@"sending %@",[athleteObjects objectForKey:@"link"]);
                    rAVC.imageURL = [athleteObjects objectForKey:@"link"];
                    rAVC.albumTitle = [athleteObjects objectForKey:@"title"];
                    rAVC.incAlbum = athleteObjects;
                    rAVC.saveKey = key;
                    
                    rAVC.incommingURL = self.incommingURL;
                    rAVC.incommingTeamURL= self.incommingTeamURL;
                    rAVC.backgroundImagePath = self.backgroundImagePath;
                    rAVC.teamName = self.teamName;
                    rAVC.haveRoster = self.haveRoster;
                    rAVC.longForm = self.longForm;
                    
                    rAVC.teamRoster = self.teamRoster;
                    rAVC.stories = self.stories;
                    rAVC.coaches = self.coaches;
                    rAVC.albums = self.albums;
                    rAVC.haveNews = self.haveNews;
                    rAVC.haveCoaches = self.haveCoaches;
                    rAVC.haveAlbums = self.haveAlbums;
                    
                    rAVC.schedBackground = self.schedBackground;
                    rAVC.imageBackground = self.imageBackground;
                    
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
