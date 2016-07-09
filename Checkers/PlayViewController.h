//
//  PlayViewController.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/17/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tile.h"
#import "Peon.h"
#import "TheGridView.h"
#import "TheScoreboardView.h"
#import "Hal.h"

@interface PlayViewController : UIViewController
{
    CGSize screenSize;

    UITapGestureRecognizer* singleTap;
    
    TheGridView* gridView;
    TheScoreboardView* scoreboardView;
    
    NSMutableArray* tileArray;
    NSMutableArray* userPieces;
    NSMutableArray* halPieces;
    NSMutableArray* userEndzone;
    NSMutableArray* halEndzone;
    
    NSMutableDictionary* theFieldDictionary;
    
    IBOutlet UIButton* homeButton;
    IBOutlet UIButton* helpButton;
    IBOutlet UIButton* settingsButton;
    
    Hal* hal;
    
    BOOL hilighted;
}


-(void)didSingleTap:(UITapGestureRecognizer*)aSingleTap;

-(NSMutableArray*)getTileArrayOfAffiliation:(int)affiliationInit;
-(NSMutableDictionary*)getCurrentFieldDictionary;
@end