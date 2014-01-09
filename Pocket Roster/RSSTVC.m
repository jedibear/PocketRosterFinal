//
//  RSSTVC.m
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import "RSSTVC.h"
#import "RSSCell.h"
#import "News Story View Controller.h"
#define genURL @"http://athletics.bowdoin.edu/landing/headlines-featured?feed=rss_2.0"
#define footURL @"http://athletics.bowdoin.edu/sports/fball/headlines-featured?feed=rss_2.0"
#define swimMURL @"http://athletics.bowdoin.edu/sports/mswimdive/headlines-featured?feed=rss_2.0"
#define laxMURL @"http://athletics.bowdoin.edu/sports/mlax/headlines-featured?feed=rss_2.0"
#define baseballURL @"http://athletics.bowdoin.edu/sports/bsb/headlines-featured?feed=rss_2.0"


@interface RSSTVC ()

@end

@implementation RSSTVC

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
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (!self.haveNews) {
        
        [self fetchRSS];
        self.haveNews = YES;
    }
    
    [self.load stopAnimating];
    [self.tableView reloadData];
    
}

-(void)fetchRSS{
    
    self.stories = [[NSMutableArray alloc]init];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
    NSURL *xmlURL = [NSURL URLWithString:[self getCorrectURL]];
    
    NSXMLParser *rssParser = [[NSXMLParser alloc]initWithContentsOfURL:xmlURL];
    
    [rssParser setDelegate:self];
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
    
    [rssParser parse];
    
}

-(NSString*)getCorrectURL{
    
    NSString *rssURL;
    NSString *baseURL = @"http://athletics.bowdoin.edu";
    
    if(!self.incommingTeamURL){
        return self.newsURL;
    }else{
        NSURL *theURL = [[NSURL alloc] initWithString:self.newsURL];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:theURL];
    
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
        
        NSString *htmlCode = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
        NSScanner *scanner = [NSScanner scannerWithString:htmlCode];
        [scanner scanUpToString:@"<div class=\"default-headlines" intoString:nil];
        [scanner scanUpToString:@"/div>" intoString:nil];
        [scanner scanUpToString:@"href=\"" intoString:nil];
        [scanner scanUpToString:@"\">" intoString:&rssURL];
        
        return [baseURL stringByAppendingString:[rssURL substringFromIndex:6]];
    }
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
    return [self.stories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    static NSString *CellIdentifier = @"Cell";
    RSSCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[RSSCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.title.text = [[self.stories objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.description.text = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"summary"];
    cell.image.image = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"image"];
    
    return cell;
}



- (void)parserDidStartDocument:(NSXMLParser *)parser {
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
    
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
   
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		self.item = [[NSMutableDictionary alloc] init];
		self.currentTitle = [[NSMutableString alloc] init];
		self.currentDate = [[NSMutableString alloc] init];
		self.currentSummary = [[NSMutableString alloc] init];
		self.currentLink = [[NSMutableString alloc] init];
        self.imageURL = [[NSMutableString alloc]init];
        self.storyImage = [[UIImage alloc]init];
	}
    if ([elementName isEqualToString:@"title"]) {
        self.currentElement = @"title";
    }
    if ([elementName isEqualToString:@"link"]) {
        self.currentElement = @"link";
    }
    if ([elementName isEqualToString:@"description"]) {
        self.currentElement = @"description";
    }
    if ([elementName isEqualToString:@"date"]) {
        self.currentElement = @"date";
    }
    if ([elementName isEqualToString:@"media:content"]){
        self.currentElement = @"image";
        self.imageURL = [attributeDict objectForKey:@"url"];
        NSURL *url = [NSURL URLWithString:self.imageURL];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
        self.storyImage = [UIImage imageWithData:imageData];
        
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
	
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[self.item setObject:self.currentTitle forKey:@"title"];
		[self.item setObject:self.currentLink forKey:@"link"];
		[self.item setObject:self.currentSummary forKey:@"summary"];
		[self.item setObject:self.currentDate forKey:@"date"];
        if (self.storyImage) {
            [self.item setObject:self.storyImage forKey:@"image"];
        }
        
		[self.stories addObject:self.item ];
		
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	// save the characters for the current item...
	if ([self.currentElement isEqualToString:@"title"]) {
		[self.currentTitle appendString:string];
	} else if ([self.currentElement isEqualToString:@"link"]) {
		[self.currentLink appendString:string];
	} else if ([self.currentElement isEqualToString:@"description"]) {
		[self.currentSummary appendString:string];
        
	} else if ([self.currentElement isEqualToString:@"pubDate"]) {
		[self.currentDate appendString:string];
	} else if ([self.currentElement isEqualToString:@"image"]){
        //[self.imageURL appendString:string];
       
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([sender isKindOfClass:[UITableViewCell class] ]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
       
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"webView"]) {
                    
                self.sequeLink = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"link"];
                NSString *newsURL = [self.sequeLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                newsURL = [newsURL stringByReplacingOccurrencesOfString:@" " withString:@""];
                
                if ([segue.destinationViewController isKindOfClass:[News_Story_View_Controller class]]) {
                    News_Story_View_Controller *newsTMP = (News_Story_View_Controller *)segue.destinationViewController;
                    
                    newsTMP.teamName = self.teamName;
                    newsTMP.team = self.teamName;
                    newsTMP.newsURL = newsURL;
                    
                    newsTMP.newsURLInc = self.newsURL;
                    newsTMP.longForm = self.longForm;
                    newsTMP.incommingTeamURL = self.incommingTeamURL;
                    newsTMP.backgroundImagePath = self.backgroundImagePath;
                    newsTMP.incTitle = [[self.stories objectAtIndex:indexPath.row] objectForKey:@"title"];
                    
                    newsTMP.teamRoster = self.teamRoster;
                    newsTMP.stories = self.stories;
                    newsTMP.coaches = self.coaches;
                    newsTMP.albums = self.albums;
                    newsTMP.haveNews = self.haveNews;
                    newsTMP.haveCoaches = self.haveCoaches;
                    newsTMP.haveAlbums = self.haveAlbums;
                    newsTMP.haveRoster = self.haveRoster;
                    
                    newsTMP.schedBackground = self.schedBackground;
                    newsTMP.imageBackground = self.imageBackground;
                    
                }
                
                
                
            }
        }
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
