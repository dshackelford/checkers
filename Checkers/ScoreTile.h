//
//  ScoreTile.h
//  Checkers
//
//  Created by Dylan Shackelford on 7/9/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "Tile.h"

@interface ScoreTile : Tile
{
    
}

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit LineWidth:(double)lineWidthInit inView:(UIView*)viewInit;

@end