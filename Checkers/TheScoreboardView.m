//
//  TheScoreboardView.m
//  Checkers
//
//  Created by Dylan Shackelford on 7/2/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TheScoreboardView.h"

@implementation TheScoreboardView

-(void)drawScoreBoardAboveGrid:(TheGridView*)aGridViewInit
{
    CGSize tileSize = CGSizeMake(40, 40);

    userScoreTile = [[ScoreTile alloc] initWithSize:tileSize atPoint:CGPointMake(0, 0) LineWidth:3 inView:self];
    
    userScoreTile = [[ScoreTile alloc] initWithSize:tileSize atPoint:CGPointMake(tileSize.width, 0) LineWidth:3 inView:self];
    
    userScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tileSize.width, tileSize.height)];
    userScoreLabel.textAlignment = NSTextAlignmentCenter;
    userScoreLabel.text = @"0";
    [userScoreLabel setFont:[UIFont fontWithName:@"Helvetica" size:27]];
    
    halScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileSize.width, 0, tileSize.width, tileSize.height)];
    halScoreLabel.textAlignment = NSTextAlignmentCenter;
    halScoreLabel.text = @"0";
    [halScoreLabel setFont:[UIFont fontWithName:@"Helvetica" size:27]];
    
    [self addSubview:userScoreLabel];
    [self addSubview:halScoreLabel];
    
    userScore = 0;
    halScore = 0;
    
}

-(void)setUserScore:(double)userScoreInit
{
    userScoreLabel.text = [NSString stringWithFormat:@"%f",userScoreInit];
    userScore = userScoreInit;
    
}

-(void)setHalScore:(double)halScoreInit
{
    halScoreLabel.text = [NSString stringWithFormat:@"%.0f",halScoreInit];
//    halScoreLabel.text = @"ad";
    halScore = halScoreInit;
}



@end