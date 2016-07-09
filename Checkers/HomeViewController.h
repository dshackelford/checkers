//
//  HomeViewController.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayViewController.h"
#import "AppUtilities.h"

@interface HomeViewController : UIViewController
{
    IBOutlet UIButton* playButton;
    IBOutlet UIButton* aboutButton;
    IBOutlet UIButton* settingsButton;
    IBOutlet UIButton* helpButton;
    
    IBOutlet UILabel* atitleLabel;
    IBOutlet UIButton* titleButton;
    IBOutlet UILabel* usernameLabel;
    
    CGSize screenSize;
}

@end