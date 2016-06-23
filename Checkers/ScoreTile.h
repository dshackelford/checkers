//
//  ScoreTile.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/22/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "Tile.h"

@interface ScoreTile : Tile
{
    UILabel* scoreLabel;
}

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit inView:(UIView*)viewInit;
-(void)setScore:(double)scoreInit;

@end
