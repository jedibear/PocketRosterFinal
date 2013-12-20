//
//  HomeVC.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 12/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface HomeVC : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)openMail:(id)sender;

@end
