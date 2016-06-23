//
//  ScoreTile.m
//  Checkers
//
//  Created by Dylan Shackelford on 6/22/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScoreTile.h"

@implementation ScoreTile

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit inView:(UIView*)viewInit
{
    self = [super init];
    
    origin = pointInit;
    size = sizeInit;
    bounds = CGRectMake(origin.x + 5, origin.y + 5, size.width, size.height);
    gridView = viewInit;
    
    scoreLabel = [[UILabel alloc] initWithFrame:bounds];
    scoreLabel.text = @"10";
    scoreLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
    
    scoreLabel.textAlignment = 1;
    scoreLabel.textColor=[UIColor blackColor];
    scoreLabel.font = [UIFont boldSystemFontOfSize:40];
        [viewInit addSubview:scoreLabel];
    return self;
}

-(void)setScore:(double)scoreInit
{
    scoreLabel.text = [NSString stringWithFormat:@"%.0f",scoreInit];
}

@end