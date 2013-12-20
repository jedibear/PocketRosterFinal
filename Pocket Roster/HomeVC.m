//
//  HomeVC.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 12/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

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
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)openMail:(id)sender {
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"A Message to BPR"];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"bowdoinpocketroster@gmail.com", nil];
                                 [mailer setToRecipients:toRecipients];
                                 
                                 NSString *emailBody = @" ";
                                 [mailer setMessageBody:emailBody isHTML:NO];
                                 [self presentModalViewController:mailer animated:YES];
                                 
                                 }
                                 else
                                 {
                                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                                                     message:@"Your device doesn't support the composer sheet"
                                                                                    delegate:nil
                                                                           cancelButtonTitle:@"OK"
                                                                           otherButtonTitles: nil];
                                     [alert show];
                                     
                                 }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self dismissModalViewControllerAnimated:YES];
}

@end
