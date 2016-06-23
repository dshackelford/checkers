//
//  HomeViewController.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayViewController.h"

@interface HomeViewController : UIViewController
{
    IBOutlet UIButton* playButton;
//    IBOutlet UIButton* aboutButton;
//    IBOutlet UIButton* settingsButton;
//    IBOutlet UIButton* helpButton;
    
//    UIViewController* PlayViewController;
    
    IBOutlet UILabel* atitleLabel;
    
    CGSize screenSize;
}

@end