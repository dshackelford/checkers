//
//  ScoreBoard.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/22/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "Board.h"
#import "Tile.h"
#import "Grid.h"
#import "ScoreTile.h"

@interface ScoreBoard : Board
{
    double userScore;
    double compScore;
    
    ScoreTile* userTile;
    ScoreTile* compTile;
}

-(id)initWithGrid:(Grid*)GridInit inView:(UIView*)viewInit;
-(void)updateScore:(double)userScore CompScore:(double)compScore;
-(void)highlightAScoreTile:(BOOL)user;


@end
