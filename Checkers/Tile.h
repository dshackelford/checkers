//
//  Tile.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/20/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "Board.h"

@interface Tile : Board
{
    UIView* gridView;
    UIImageView* bezierImageView;
}

-(id)initWithSize:(CGSize)sizeInit atPoint:(CGPoint)pointInit inView:(UIView*)viewInit;
-(void)drawTileToView;
-(void)fillTile;
-(void)drawCircle;
@end
