//
//  PlayViewController.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grid.h"
#import "Tile.h"
#import "ScoreBoard.h"
#import "Inventory.h"

#import "TheGridView.h"

@interface PlayViewController : UIViewController
{
    CGSize screenSize;

    UITapGestureRecognizer* singleTap;

    Grid* theGrid;
    ScoreBoard* theScoreBoard;
    Inventory* userInven;
    Inventory* compInven;
    
    
    TheGridView* gridView;
    
    IBOutlet UIButton* homeButton;
    IBOutlet UIButton* helpButton;
    IBOutlet UIButton* settingsButton;
}


-(void)didSingleTap:(UITapGestureRecognizer*)aSingleTap;

@end