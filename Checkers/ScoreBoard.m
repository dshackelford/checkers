//
//  ScoreBoard.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/22/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScoreBoard.h"


@implementation ScoreBoard

-(id)initWithGrid:(Grid*)GridInit inView:(UIView*)viewInit
{
    self = [super init];
    
    size = CGSizeMake(100, 50);
    
    origin = CGPointMake([GridInit getRect].origin.x + [GridInit getRect].size.width/2 - size.width/2 - 5,[GridInit getRect].origin.y - size.height - 10);
    
    bounds = CGRectMake(origin.x, origin.y, size.width, size.height);
    
    userTile = [[ScoreTile alloc] initWithSize:CGSizeMake(size.width/2, size.height) atPoint:origin inView:viewInit];
    
    [userTile drawTileToView];
    
    compTile = [[ScoreTile alloc] initWithSize:CGSizeMake(size.width/2, size.height) atPoint:CGPointMake(origin.x + size.width/2, origin.y) inView:viewInit];
    
    [compTile drawTileToView];
    
    userScore = 0;
    compScore = 10;
    [self updateScore:userScore CompScore:compScore];
    
    return self;
}

-(void)updateScore:(double)userScoreInit CompScore:(double)compScoreInit
{
    [userTile setScore:userScoreInit];
    [compTile setScore:compScoreInit];
}

@end