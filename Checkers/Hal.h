//
//  Hal.h
//  Checkers
//
//  Created by Dylan Shackelford on 6/30/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheGridView.h"
#import "Tile.h"

@interface Hal : NSObject
{
    NSMutableArray* pieces;
    NSMutableArray* playerPieces;
    NSMutableArray* gridTiles;
    
    TheGridView* theGridView;
}

-(id)initWithGrid:(TheGridView*)gridInit andFirstPieceIndex:(double)pieceIndexInit;
-(void)move;
@end