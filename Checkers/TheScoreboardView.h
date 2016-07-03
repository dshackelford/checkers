//
//  TheScoreboardView.h
//  Checkers
//
//  Created by Dylan Shackelford on 7/2/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewMaster.h"
#import "Tile.h"
#import "ScoreTile.h"
#import "TheGridView.h"

@interface TheScoreboardView : ViewMaster
{
    ScoreTile* userScoreTile;
    ScoreTile* halScoreTile;
    
    double userScore;
    double halScore;
    
    UILabel* userScoreLabel;
    UILabel* halScoreLabel;
}


-(void)drawScoreBoardAboveGrid:(TheGridView*)aGridViewInit;

-(void)setHalScore:(double)halScoreInit;
-(void)setUserScore:(double)userScoreInit;
@end